module Chawk
  # This is not implimented yet.
  module Quantizer
    # This is not implimented yet.
    def starting_step(x, step_width)
      if (x % step_width) == 0
        x
      else
        x - (x % step_width) + step_width
      end
    end

    # This is not implimented yet.
    def ending_step(x, step_width)
      if (x % step_width) == 0
        x
      else
        x - (x % step_width)
      end
    end

    # This is not implimented yet.
    def quantize(ary, step_width, steps = nil)
      # TODO: Needs lots more testing, then faster implementation
      # with caching (probaby at data add point)
      # puts "#{ary.length}"
      step = starting_step(ary[0][1], step_width)
      end_step = ending_step(ary[-1][1], step_width)
      out = [ary[0]]
      while step > end_step
        step -= step_width
        next_step = step - step_width
        data = ary[0]
        data = ary.reverse.find { |a|a[1] > next_step } || data# (ary[-1])
        out << [data[0], step]
      end
      out
    end
  end
end
