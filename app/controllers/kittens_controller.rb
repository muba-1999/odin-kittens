class KittensController < ApplicationController
    def index
        @kitten = Kitten.all
    end

    def show
        @kitten = kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)

        if @kitten.save
            redirect_to root, notice: "kitten was successfully created"
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        @kitten = Kitten.find(params[:id])

        if @kitten.update(kitten_params)
            redirect_to root, notice: "Kitten was successfully updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @kitten.destroy
        notice: "Kitten was successfully deleted"
    end

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
end
