class KittensController < ApplicationController
    def index
        @kitten = Kitten.all
    end

    def show
    
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)

        if @kitten.save
            redirect_to root_path, notice: "kitten was successfully created"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit

    end

    def update
        @kitten = Kitten.find(params[:id])

        if @kitten.update(kitten_params)
            redirect_to root_path, notice: "Kitten was successfully updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @kitten = Kitten.find(params[:id])
        
        if @kitten.present?
            @kitten.destroy
        end
        redirect_to root_path, notice: "Kitten was successfully deleted"
        
    end

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
