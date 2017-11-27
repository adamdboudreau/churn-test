class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def test
    puts "\n test action...calling test req..."
    begin
      Timeout.timeout(5) do
        test_req
      end
    rescue Timeout::Error
      puts "TIMEOUT..."
    end

    render nothing: true
  end

  def test_req(params={})
    puts 'test req'

    # path = 'workspaces/dbbfd492f47242058f1db7c3a877e75f/services/864422834fa443508e23c901eb151054/execute?api-version=2.0&details=true'
    # url = "https://ussouthcentral.services.azureml.net"
    # token = "0HmoDLk7iHc/KY88+PJsCw3SWT4UBbPvJk0dkllAlNhFGVGDm+v2tn/SF4QFHDOlEr2BaOXmOpy13rQFz07Fng=="
    path = "workspaces/dbbfd492f47242058f1db7c3a877e75f/services/2be44fe3833346d687602bf35ace4f4a/execute?api-version=2.0&details=true"
    url = "https://ussouthcentral.services.azureml.net"
    token = "dyvc/hRs3H2Vgg/mhE3G8ZqenCpStb0Kq3dZKh8GAp2LR3ciNcpNhIeF8vt+O3xqTtuCS5P1PAoS3vtl5ds7WA=="

    conn = Faraday.new(url, ssl: {verify: false}) do |conn|
      conn.use FaradayMiddleware::FollowRedirects, cookies: :all
      conn.request :url_encoded
      conn.adapter :net_http
    end

    response = conn.send(:post, path) do |req|
      req.headers["Authorization"] ="Bearer #{token}" unless token.blank?
      # req.headers["Authorization:Bearer"] ="#{token.inspect}" unless token.blank?
      req.headers["Content-Type"] ="application/json"
      # req.headers["Authorization"] ="Token token=#{token.inspect}" unless token.blank?

      req.params = sampler
      req.body = sampler.to_json
    end

    puts "\nresponse: #{response.inspect}\n"

    JSON.parse(response.body) rescue { response_status: response.status }

    puts ' done test req'
  end

  def sampler
    token = "dyvc/hRs3H2Vgg/mhE3G8ZqenCpStb0Kq3dZKh8GAp2LR3ciNcpNhIeF8vt+O3xqTtuCS5P1PAoS3vtl5ds7WA=="
    {
      # 'access'=> token,
      # 'headers'=> {'Authorization:Bearer'=> token, 'Authorization'=> token, 'Content-Type'=> 'application/json'},
      'api-version'=>2.0,'details'=>true,
      "Inputs"=> {
        "input1"=> {
          "ColumnNames"=> [
          "scrollspeed",
          "towardsaddressbar",
          "churn"
          ],
          "Values"=> [
            [
              "120",
              "0",
              "0"
            ],
            [
              "0",
              "1",
              "0"
            ]
          ]
        }
      },
        "GlobalParameters"=> {}
    }
  end

  def get_churn
    # scrollspeed: 180, towardsaddressbar: 0
    path = "workspaces/dbbfd492f47242058f1db7c3a877e75f/services/2be44fe3833346d687602bf35ace4f4a/execute?api-version=2.0&details=true"
    url = "https://ussouthcentral.services.azureml.net"
    token = "dyvc/hRs3H2Vgg/mhE3G8ZqenCpStb0Kq3dZKh8GAp2LR3ciNcpNhIeF8vt+O3xqTtuCS5P1PAoS3vtl5ds7WA=="

    churn_p = get_churn_params(churn_params)

    conn = Faraday.new(url, ssl: {verify: false}) do |conn|
      conn.use FaradayMiddleware::FollowRedirects, cookies: :all
      conn.request :url_encoded
      conn.adapter :net_http
    end

    response = conn.send(:post, path) do |req|
      req.headers["Authorization"] ="Bearer #{token}" unless token.blank?
      # req.headers["Authorization:Bearer"] ="#{token.inspect}" unless token.blank?
      req.headers["Content-Type"] ="application/json"
      # req.headers["Authorization"] ="Token token=#{token.inspect}" unless token.blank?

      req.params = churn_p
      req.body = churn_p.to_json
    end

    puts "\nresponse: #{response.inspect}\n"

    render json: JSON.parse(response.body) rescue { response_status: response.status }
  end

  def get_churn_params(p={})
    {
        'api-version'=>2.0,'details'=>true,
        "Inputs"=> {
            "input1"=> {
                "ColumnNames"=> [
                    "scrollspeed",
                    "towardsaddressbar",
                    "churn"
                ],
                "Values"=> [
                    [
                        p[:scrollspeed],
                        p[:towardsaddressbar],
                        "0"
                    ]
                ]
            }
        },
        "GlobalParameters"=> {}
    }
  end

  # note actually saves scroll history record
  def get_scroll_history
    # "scroll_speed", "towards_address_bar", "churn", "sid"
    begin
      if %w(1 true).include?(ENV['disable_scroll_history_saving'].to_s)
        render json: {error: 'too much data to record'}
      else
        puts "get scroll history: #{scroll_history_params.inspect}"
        sh = ScrollHistory.create(scroll_history_params)

        render json: sh.attributes.to_json
      end

    rescue Exception => e
      render json: {error: e.inspect}
    end
  end

  def test_content_api

  end

  # note actually saves scroll history record
  def test_content_api_call
    path = "workspaces/dbbfd492f47242058f1db7c3a877e75f/services/e812851fded941ec9540738c7901f912/execute?api-version=2.0&details=true"
    url = "https://ussouthcentral.services.azureml.net"
    token = "FaHooKwT2N9S14UXfdzgcyZhNybYohkvAKM3toOo6hv30TJV4vAuIb6z0gCBJ8IIzOSMRYTbv4M4vw4x0Jka/A=="

    content_p = get_content_api_params(content_api_params)

    puts "content_api params: #{content_api_params.inspect}"

    conn = Faraday.new(url, ssl: {verify: false}) do |conn|
      conn.use FaradayMiddleware::FollowRedirects, cookies: :all
      conn.request :url_encoded
      conn.adapter :net_http
    end

    response = conn.send(:post, path) do |req|
      req.headers["Authorization"] ="Bearer #{token}" unless token.blank?
      req.headers["Content-Type"] ="application/json"

      req.params = content_p
      req.body = content_p.to_json
    end

    puts "\nresponse: #{response.inspect}\n"
    api_response_json = JSON.parse(response.body) rescue { response_status: response.status }
    scored_content = ""
    if api_response_json['Results']
      scored_content = api_response_json['Results']['output1']['value']['Values'][-1][-1]
    end

    render json: {content: scored_content}.merge(api_response_json)
  end

  def get_content_api_params(p={})
    {
      'api-version'=>2.0,'details'=>true,
      "Inputs"=> {
        "input1"=> {
          "ColumnNames"=> [
            "GeoSegmentation Cities",
            "Section (evar6)",
            "Content Name (evar10)",
            "Page URL (evar13)",
            "Page Views"
          ],
          "Values"=> [
            [
                p[:city],
                p[:section],
                p[:content],
                p[:page_url],
                p[:page_views].to_i
            ]
          ]
        }
      },
      "GlobalParameters"=> {}
    }
  end

  def scroll_histories
    begin
      @scroll_histories = ScrollHistory.all
    rescue Exception => e
      @scroll_histories = []
      puts "scroll history exception: #{e.inspect}"
    end
  end

  def test_request(params={})
    require 'net/http'

    # furl = "http://localhost:3000/posts" # "http://www.google.com"
    # url = URI.parse(furl)
    # # req = Net::HTTP::Post.new(url.to_s, {authenticity_token: form_authenticity_token, post: 'asdf'})
    # req = Net::HTTP::Get.new(url.to_s)
    # res = Net::HTTP.start(url.host, url.port) {|http|
    #   http.request(req)
    # }
    #
    # puts res.body

    furl = "https://ussouthcentral.services.azureml.net/workspaces/dbbfd492f47242058f1db7c3a877e75f/services/864422834fa443508e23c901eb151054/execute?api-version=2.0&details=true"
    req = Net::HTTP.post URI(furl),
                         sample_params.to_json,
                   # { authenticity_token: form_authenticity_token, "q" => "ruby", "max" => "50", post: { content: 'asdf' } }.to_json,
                   #       "Authorization:Bearer" => "0HmoDLk7iHc/KY88+PJsCw3SWT4UBbPvJk0dkllAlNhFGVGDm+v2tn/SF4QFHDOlEr2BaOXmOpy13rQFz07Fng==",
                   #       "Authorization" => "0HmoDLk7iHc/KY88+PJsCw3SWT4UBbPvJk0dkllAlNhFGVGDm+v2tn/SF4QFHDOlEr2BaOXmOpy13rQFz07Fng==",
                         "Authorization" => "Bearer: 0HmoDLk7iHc/KY88+PJsCw3SWT4UBbPvJk0dkllAlNhFGVGDm+v2tn/SF4QFHDOlEr2BaOXmOpy13rQFz07Fng==",
                   "Content-Type" => "application/json"

    puts "\n\n req: #{req.inspect}"
  end

  def sample_params
    {
        "Inputs"=> {
        "input1"=> {
        "ColumnNames"=> [
        "symboling",
        "normalized-losses",
        "make-id",
        "fuel-type",
        "aspiration",
        "num-of-doors",
        "body-style",
        "drive-wheels",
        "engine-location",
        "wheel-base",
        "length",
        "width",
        "height",
        "curb-weight",
        "engine-type",
        "num-of-cylinders",
        "engine-size",
        "fuel-system",
        "bore",
        "stroke",
        "compression-ratio",
        "horsepower",
        "peak-rpm",
        "city-mpg",
        "highway-mpg",
        "price"
    ],
        "Values"=> [
        [
            "0",
            "0",
            "0",
            "value",
            "value",
            "value",
            "value",
            "value",
            "value",
            "0",
            "0",
            "0",
            "0",
            "0",
            "value",
            "value",
            "0",
            "value",
            "0",
            "0",
            "0",
            "0",
            "0",
            "0",
            "0",
            "0"
        ],
        [
            "0",
            "0",
            "0",
            "value",
            "value",
            "value",
            "value",
            "value",
            "value",
            "0",
            "0",
            "0",
            "0",
            "0",
            "value",
            "value",
            "0",
            "value",
            "0",
            "0",
            "0",
            "0",
            "0",
            "0",
            "0",
            "0"
        ]
    ]
    }
    },
        "GlobalParameters"=> {}
    }
  end

  # GET /posts
  # GET /posts.json
  def index
    begin
      @posts = Post.all
    rescue Exception => e
      @posts = []
      puts "exception pulling posts: #{e.inspect}"
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    puts "create post: #{post_params.inspect}"
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content)
    end

    def churn_params
      params.permit(:scrollspeed, :towardsaddressbar)
    end

  def scroll_history_params
    params.permit(["scroll_speed", "towards_address_bar", "churn", "sid"].map(&:to_sym))
  end

  def content_api_params
    params.permit(:city, :section,:content,:page_url,:page_views)
  end
end
