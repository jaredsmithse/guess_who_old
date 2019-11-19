# frozen_string_literal: true

class GuessesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @stats = Guesses::Stats.new(current_employee)
  end

  def new
    debugger
    @guess_service = GuessService.new(current_employee)
    @guess = current_employee.guesses.build(
      correct_employee_id: @guess_service.correct_employee.id,
    )
  end

  def create
    @guess = current_employee.guesses.create(guess_params) do |guess| 
      guess.correct = correct_guess?
    end

    if @guess.correct?
      redirect_to(
        new_employee_guess_url(current_employee), 
        flash: { success: "Correct!" },
      )
    else
      flash[:error] = "This isn't #{@guess.guessed_employee.name}!"
      @guess_service = GuessService.new(current_employee, @guess.correct_employee)
      @guess = current_employee.guesses.build(
        correct_employee_id: @guess_service.correct_employee.id,
        guessed_employee_id: @guess.guessed_employee_id,
      )
      render :new
    end
  end

  private def guess_params
    params.require(:guess).permit(:guessed_employee_id, :correct_employee_id)
  end

  private def correct_guess?
    guess_params[:guessed_employee_id] == guess_params[:correct_employee_id]
  end
end