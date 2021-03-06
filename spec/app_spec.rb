# frozen_string_literal: true

require "spec_helper"

RSpec.describe "App" do
  describe "received post at" do
    describe "/" do
      let(:parameters) { {} }
      let(:enviroments) { {} }

      subject do
        post "/", params = parameters, rack_env = enviroments
      end

      it "calls Identificator.identify" do
        expect(Identificator).to receive(:identify).and_call_original

        post "/"
      end

      context "pull request request" do
        let(:url) { "https://api.github.com/repos/Test/test/issues/1/comments" }
        let(:body) do
          StringIO.new(
            {
              "pull_request": {
                "comments_url": url
              }
            }.to_json
          )
        end

        let(:enviroments) do
          {
            "HTTP_X_GITHUB_EVENT" => "pull_request",
            "rack.input" => body
          }
        end

        before do
          stub_request(:post, url).to_return(status: 200)
        end

        it "responds ok" do
          subject

          expect(last_response).to be_ok
        end
      end

      context "other requests" do
        let(:enviroments) { { "SOME_RANDOM_HEADER" => "something unecessary" } }

        it "responds 412" do
          subject

          expect(last_response).not_to be_ok
        end
      end
    end
  end
end
