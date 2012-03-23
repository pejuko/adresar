class FirmsController < ApplicationController
  # GET /firms
  # GET /firms.json
  def index
    @firms = Firm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @firms }
    end
  end

  # GET /firms/1
  # GET /firms/1.json
  def show
    @firm = Firm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @firm }
    end
  end

  # GET /firms/new
  # GET /firms/new.json
  def new
    @firm = Firm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @firm }
    end
  end

  # GET /firms/1/edit
  def edit
    @firm = Firm.find(params[:id])
  end

  # POST /firms
  # POST /firms.json
  def create
    tags = params[:firm].delete(:tags_attributes)
    delete_empty(params[:firm])
    @firm = Firm.new(params[:firm])
    append_tags(tags)

    respond_to do |format|
      if @firm.save
        format.html { redirect_to @firm, notice: 'Firm was successfully created.' }
        format.json { render json: @firm, status: :created, location: @firm }
      else
        format.html { render action: "new" }
        format.json { render json: @firm.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /firms/1
  # PUT /firms/1.json
  def update
    @firm = Firm.find(params[:id])
    delete_empty(params[:firm])
    append_tags(params[:firm].delete(:tags_attributes))

    respond_to do |format|
      if @firm.update_attributes(params[:firm])
        format.html { redirect_to @firm, notice: 'Firm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @firm.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firms/1
  # DELETE /firms/1.json
  def destroy
    @firm = Firm.find(params[:id])
    @firm.destroy

    respond_to do |format|
      format.html { redirect_to firms_url }
      format.json { head :no_content }
    end
  end

private

  # handle tags from form
  # make sure no duplicit tags are created or assigned
  def append_tags(tags)
    keys = tags.keys.sort
    new_tags = []
    keys.each do |k|
      next if tags[k]["name"].to_s.strip.empty?
      tag = Tag.find_or_create_by_name(tags[k]["name"])
      if tags[k]["_destroy"] == "1"
        @firm.tags.delete(tag)
      else
        new_tags << tag
      end
    end
    new_tags.each { |t| @firm.tags << t unless @firm.tags.include?(t) }
  end

  # delete recursively empty attributes from form
  # no empty contacts or addresses are created
  def delete_empty(hash)
    empty = true
    hash.each do |k, v|
      if v.kind_of?(Hash)
        vempty = delete_empty(v)
        empty = false unless vempty
        hash.delete(k) if vempty
      else
        empty = false unless v.empty?
      end
    end
    hash.clear if empty
    empty
  end

end
