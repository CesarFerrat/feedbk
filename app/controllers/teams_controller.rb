class TeamsController < ApplicationController
	# GET /teams
  # GET /teams.json
  def index
    @teams = current_user.teams
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find_by(:id => params[:id])
    @users = @team.users
  end

  # GET /teams/new
  def new
    @user = User.find_by(:id => params[:id])
    @team = Team.new
    
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    puts team_params
    t = team_params
    @team = Team.new(t.merge({user_ids: params["user_id"]}))
    @team.users << current_user


    respond_to do |format|
      if @team.save
        format.html { redirect_to "/users/#{current_user.id}/teams", notice: 'Team was successfully created.' }
        format.json { render :index, status: :created, location: @team }
      else
        format.html { render :new, notice: 'An error occured' }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to @teams, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def add_member
      @user = current_user
      @team = Team.find_by(:id => params[:team_id])
  end

  def invitation_form
  end


  def organization
    @company = current_user.company
    @company_members = User.where(:company_id => "@company")
    @managers = @company_members.with_role(:manager)
    @user = User.find_by(:id => params[:user_id])
    @teams = @user.teams
    @team = Team.find_by(:id => params[:team_id])
    @team_members = @team.users
  end



  private
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:user_id, :team_name, :team_id)
    end

end
