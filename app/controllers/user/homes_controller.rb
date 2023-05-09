class User::HomesController < ApplicationController
  def top
    @category = Spot.pluck(:category)
    @aggregate = aggregateSpot(@category)
    @sum = sumSpot(@category)
  end

  def aggregateSpot(array)
    result = [["賛成",0],["反対",0],["どちらでもない",0],["無回答",0]]
    array.each do |i|
      if i == 1
        result[0][1] += 1
      elsif i == 0
        result[1][1] += 1
      elsif i == nil
        result[3][1] += 1
      else
        result[2][1] += 1
      end
    end
    return result
  end

  def sumSpot(array)
    result = [["総投票数",0],["有効投票数",0],["無効投票数",0]]
    array.each do |i|
      if i == nil
        result[2][1] += 1
      else
        result[1][1] += 1
      end
    end
    result[0][1] = array.length
    return result
  end


  def about
  end
end
