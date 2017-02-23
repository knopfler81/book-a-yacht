module YachtsHelper
  def guest_collection
    (1..10).map do |i|
      ["#{i} guests", i]
    end
  end
  def cabin_collection
    (1..15).map do |i|
      ["#{i} cabins", i]
    end
  end
  def crew_collection
    (1..10).map do |i|
      ["#{i} crew members", i]
    end
  end
end
