class EvaluationsController < ApplicationController
  before_action :authenticate_end_user!
  def create
    @quote = Quote.find(params[:quote_id])
      if current_end_user.evaluations.exists?(quote_id: @quote.id, status: params[:status]) #既に存在する場合
        @evaluation = current_end_user.evaluations.find_by(quote_id: @quote.id, status: params[:status])
        @evaluation.destroy
      else #まだ存在しない場合
        @evaluation = current_end_user.evaluations.new(quote_id: @quote.id, status: params[:status])
        @evaluation.save
      end
      if params[:status] == 'good' #statusカラムにgoodが来たならbadを削除
        @evaluation = current_end_user.evaluations.find_by(quote_id: @quote.id, status: 'bad')
        if @evaluation.present?
          @evaluation.destroy
        end
      else #badが来たらgoodを削除
        @evaluation = current_end_user.evaluations.find_by(quote_id: @quote.id, status: 'good')
        if @evaluation.present?
          @evaluation.destroy
        end
      end
  end

end
