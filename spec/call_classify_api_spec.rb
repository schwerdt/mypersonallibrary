require 'api_interaction/call_classify_api.rb'
require 'vcr'
require 'vcr_setup.rb'

USER_QUERY = { "title" => "Isaac's Storm" }
BOOK_TITLE = "Isaac's storm : a man, a time, and the deadliest hurricane in history"
OCLC_NUM = "41002882"


describe  do
  it "takes in title as a search parameter and returns a dictionary of results" do
    VCR.use_cassette("first_api_call") do
      book_list = CallClassifyAPI.query_and_extract_booklist(USER_QUERY, true)
      expect(book_list[0]["title"]).to eql(BOOK_TITLE)
    end
  end

  it "takes an owi number and returns information about one book" do
    VCR.use_cassette("second_api_call") do
      book_list = CallClassifyAPI.query_and_extract_booklist(USER_QUERY, true)
      new_query = { "owi" => book_list[0]["owi"] }
      book = CallClassifyAPI.query_and_extract_book(new_query, false)
      expect(book["title"]).to eql(BOOK_TITLE)
      expect(book["oclc"]).to eql(OCLC_NUM)
    end
  end
end
