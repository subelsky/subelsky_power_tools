# assertions for use with Capybara
# @note requires rspec 3 or greater
module PageLoadAssertions
  # @param path [String] what path to visit
  def visit!(path,*args)
    visit path,*args
    should_load(path)
  end

  # Asserts that the correct page has been loaded
  # @param path [String] what path you're expecting load successfully after the user visits in a browser
  def should_load(path)
    expect(page.current_path).to eq(path)
    expect(page.status_code).to eq(200)
  end

  # Asserts that the path is being displayed but with HTTP error code 404
  # @param path [String] what you're expecting to return 404 after the user visits
  def should_404(path)
    expect(page.current_path).to eq(path)
    expect(page.status_code).to eq(404)
  end
end
