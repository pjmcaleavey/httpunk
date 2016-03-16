require "sinatra/base"
require "json"
require "pry"

module Httpunk
  class Api < Sinatra::Base
    set :logging, true

     MUSIC_ARRAY = [
       "samples/After1", "samples/After2", "samples/After3", "samples/beat", "samples/Better1",
       "samples/Better2", "samples/DoIt1", "samples/DoIt2", "samples/Ever1", "samples/Ever2",
       "samples/Ever3", "samples/Faster1", "samples/Faster2", "samples/Harder1", "samples/Harder2",
       "samples/Hour1", "samples/Hour2", "samples/Hour3", "samples/MakeIt1", "samples/MakeIt2",
       "samples/MakeUs1", "samples/MakeUs2", "samples/MoreThan1", "samples/MoreThan2", "samples/MoreThan3",
       "samples/Never1", "samples/Never2", "samples/Never3", "samples/Our1", "samples/Our2", "samples/Our3",
       "samples/Over1", "samples/Over2", "samples/Over3", "samples/Stronger1", "samples/Stronger2",
       "samples/WorkIs1", "samples/WorkIs2", "samples/WorkIs3", "samples/WorkIt1", "samples/WorkIt2"
     ]

    #GET "/play/beat" # curl -v localhost:4567/play/beat

    get "/play/:sample" do
      sample = params["sample"]
      spawn("afplay \"samples/#{sample}.mp3\"")
      { message: "Sample success!" }.to_json
    end


    # get "/play/all" do ##work on later
    #   MUSIC_ARRAY.each do |x|
    #     all = MUSIC_ARRAY(x)
    #     spawn("afplay \"samples/#{all}.mp3\"")
    #   end
    #   { message: "Playing all" }.to_json
    # end

    # get "/play/:all" do
    #   all = MUSIC_ARRAY
    #   spawn("afplay \"samples/#{all}.mp3\"")
    #   { message: "Playing all"}
    # end

    get "/stop" do#no sample bec stops all
      #sample = params["sample"]
      spawn("killall afplay")
      { message: "No mas." }.to_json
    end

    # get "/api/test" do
    #   content_type :json
    #   { message: "Go go go !" }.to_json
    # end
    #

    get "/after" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/After#{version}.mp3\"")
      content_type :json
      { message: "Playing after#{version}" }.to_json
    end

    get "/beat" do
      spawn("afplay \"samples/beat.mp3\"")
      content_type :json
      { message: "Playing workit" }.to_json
    end

    get "/better" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Better#{version}.mp3\"")
      content_type :json
      { message: "Playing better#{version}" }.to_json
    end

    get "/doit" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/DoIt#{version}.mp3\"")
      content_type :json
      { message: "Playing doit#{version}" }.to_json
    end

    get "/ever" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Ever#{version}.mp3\"")
      content_type :json
      { message: "Playing Ever#{version}" }
    end

    get "/faster" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Faster#{version}.mp3\"")
      content_type :json
      { message: "Playing faster#{version}" }
    end

    get "/harder" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Harder#{version}.mp3\"")
      content_type :json
      { message: "Playing harder#{version}" }
    end

    get "/hour" do
      version = params["v"] ? params["v"].to_i : 1#ternary-if_this_is_a_true_value?then_the_result_is_this:else_its_this
      spawn("afplay \"samples/Hour#{version}.mp3\"")
      content_type :json
      { message: "Playing hour#{version}" }.to_json
    end

    get "/makeit" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/MakeIt#{version}.mp3\"")
      content_type :json
      { message: "Playing makeit#{version}" }
    end

    get "/makesus" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/MakeUs#{version}.mp3\"")
      content_type :json
      { message: "Playing makeus#{version}.mp3" }
    end

    get "/morethan" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/MoreThan#{version}.mp3\"")
      content_type :json
      { message: "Playing morethan#{version}" }
    end

    get "/never" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Never#{version}.mp3\"")
      content_type :json
      { message: "Playing never#{version}" }
    end

    get "/our" do
      version = params["v"] ? version["v"].to_i : 1
      spawn("afplay \"samples/Our#{version}.mp3\"")
      content_type :json
      { message: "Playing our#{version}" }
    end

    get "/over" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Over#{version}.mp3\"")
      content_type :json
      { message: "Playing over#{version}" }
    end

    get "/stronger" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/Stronger#{version}.mp3\"")
      content_type :json
      { message: "Playing over#{version}" }
    end

    get "/workis" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/WorkIs#{version}.mp3\"")
      content_type :json
      { message: "Playing workis#{version}" }
    end

    get "/workit" do
      version = params["v"] ? params["v"].to_i : 1
      spawn("afplay \"samples/WorkIt#{version}.mp3\"")
      content_type :json
      { message: "Playing workit#{version}" }
    end

    run! if app_file == $0
  end
end

# def play(sample)
#   Client.get("/play/#{sample}")
# end


# client = Client.new
# client.play("Harder2")
# client.play("beat")

#get track to stop - /stop' do
#spawn("killall afplay")
#{message: ""}.to_json
#end

#params - client req to server. for example, closing a github issue,
# the server could do params["state"]  # would be "closed"
# route parameters - get '/repos/:org/:repo/issues'
# query parameters - get http://whatever.com/the/route?parameter=value&parameter2=value


#spawn - runs the string at the prompt


#content_type :json -
