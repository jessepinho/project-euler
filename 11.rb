class Grid

  # The number, concatenated into one giant string going from left to right,
  # then top to bottom.
  @@num = '08022297381500400075040507785212507791084949994017811857608717409843694804566200814931735579142993714067538830034913366552709523046011426924685601325671370236912231167151676389419236542240402866331380244732609903450244753353783684203517125032988128642367102638406759547066183864706726206802621220956394396308409166499421245558056673992697177878968314883489637221362309750076442045351400613397343133957817532822753167159403800462161409535692163905429635314755588824001754243629855786560048357189070544443744602158515417581980816805944769287392138652177704895540045208839735991607975732162626793327986688366887576220720346336746551232639353690442167338253911249472180846293240627636206936417230238834629969826759857404361620733529783190017431497148868116235705540170547183515469169233486143520189196748'
  # Turn the number into a two-dimensional array keyed first by the y-axis, then
  # by the x-axis. Note that each two-digit number is converted to an integer,
  # which means '08' gets turned into 8.
  @@grid = @@num.split('').each_slice(2).map{|n| n.join('').to_i}.each_slice(20).to_a

  class << self

    def series x, y, dir = :e
      pos = { x: x, y: y }
      series = []
      until series.length == 4
        # Remember that the grid is keyed first by the y-axis.
        series << @@grid[pos[:y]][pos[:x]]

        # Try to move in the requested direction, rescuing the exception if no
        # numbers remain in that direction.
        begin
          pos = move pos[:x], pos[:y], dir
        rescue
          break
        end
      end
      series
    end

    def move x, y, dir = :e
      case dir
      when :e
        raise "Could not move east from #{x}, #{y}" if x + 1 > 19
        { x: x + 1, y: y }
      when :s
        raise "Could not move south from #{x}, #{y}" if y + 1 > 19
        { x: x, y: y + 1 }
      when :se
        raise "Could not move southeast from #{x}, #{y}" if x + 1 > 19 || y + 1 > 19
        { x: x + 1, y: y + 1 }
      when :sw
        raise "Could not move southwest from #{x}, #{y}" if x - 1 < 0 || y + 1 > 19
        { x: x - 1, y: y + 1 }
      end
    end
  end
end

class Griderator

  @@highest_product = 0

  def self.griderate grid
    x = 0
    y = 0
    while x < 19 || y < 19
      # Iterate through each direction, getting the product of those four
      # numbers (as long as four numbers can be found in that direction). Assign
      # the product to @highest_product if it's higher than any previously
      # found product.
      dirs = [:e, :s, :se, :sw]
      dirs.each do |dir|
        dir_series = grid.series(x, y, dir)
        if dir_series.length == 4 && (product = dir_series.reduce(:*)) > @@highest_product
          @@highest_product = product
        end
      end

      if x < 19
        # Move to the next column.
        x += 1
      elsif x == 19 && y < 19
        # Once we've reached the end of a line in the 20x20 grid, start at the
        # beginning of the next line.
        x = 0
        y += 1
      end
    end

    @@highest_product
  end
end

p Griderator.griderate Grid
# Answer: 70600674
