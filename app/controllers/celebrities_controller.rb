class CelebritiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :setup_data

  # Index
  def index
  end

  # Create
  def create
    @celebrity = {
      "name" => format_name(params[:name]),
      "notability" => params[:notability]
    }
    @celebrities.push(@celebrity)
  end

  # Read
  def show
    @name = format_name(params[:celebrity])
    @celeb_to_show = get_celebrity(@name)
  end

  # Update
  def update
    @name = format_name(params[:celebrity]) # Lindsay Lohan
    @celeb_to_update_index = get_celebrity_index(@name)
    @celebrities[@celeb_to_update_index]["notability"] = params[:notability]
  end

  # Delete
  def destroy
    @name = format_name(params[:celebrity])
    @celebrities.delete(get_celebrity(@name))
  end

  private
  def setup_data
    session["celebrities"] = [
      { "name" => "Lindsay Lohan","notability" => "Parent Trap" },
      { "name" => "Adam Sandler", "notability" => "Big Daddy" },
      { "name" => "Rob Schnider", "notability" => "Adam Sandler" }
    ] unless session["celebrities"]

    @celebrities = session["celebrities"]
  end

  private
  def get_celebrity(name)
    @celebrities.each do |celebrity|
      return celebrity if celebrity["name"] == name
    end
  end

  private
  def get_celebrity_index(name)
    @celebrities.each_with_index do |celebrity, i|
      return i if celebrity["name"] == name
    end
  end

  # Takes a name from the url in the format firstname_lastname
  # and formats it consistently with the @celebrities array
  # e.g. lindsay_logan => Lindsay Lohan
  private
  def format_name(name)
    return name.split("_").map{|el| el.capitalize}.join(" ")
  end
end