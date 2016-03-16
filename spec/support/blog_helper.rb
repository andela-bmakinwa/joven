module BlogHelper
  def assert_status_body_response(body, status = 200)
    assert_status_and_response status
    expect(last_response.body).to eq body
  end

  def assert_body_has(body_part, status = 200)
    assert_status_and_response status
    expect(last_response.body.include?(body_part)).to eq true
  end

  def assert_status_and_response(status)
    expect(last_response).to be_ok if status == 200
    expect(last_response.status).to eq status
  end

  def create_post
    post "/posts", post: {
      title: "Rack deep dive",
      body: "Building rack web applications"
    }
  end
end
