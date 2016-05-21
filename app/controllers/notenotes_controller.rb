class NotenotesController < ApplicationController
	before_action :set_note, only:[:show, :edit, :update, :destroy]
	before_action :authenticate_user!
	def index
		@note = Notenote.where(user_id: current_user)
		
	end
	def show
		
	end
	def new
		@note= current_user.notenotes.build
	end
	def create
		@note = current_user.notenotes.build(note_params)
		if @note.save
			redirect_to @note, notice: 'note was successfully created'
		else
			render 'new'
		end
		
	end
	def edit
		
	end
	def update
		@note.update(note_params)
		if @note.save
			redirect_to @note, notice:'was update'
			else
				render'edit'
			
		end
	end
	def destroy
		@note.destroy
		redirect_to notenotes_path
	end

	private
	def set_note
		
		@note= current_user.notenotes.find(params[:id])
		rescue ActiveRecord::RecordNotFound
			redirect_to root_path, notice:"You don't have permission."
		
	end
	def note_params
		params.require(:notenote).permit(:title,:content)
	end
end
