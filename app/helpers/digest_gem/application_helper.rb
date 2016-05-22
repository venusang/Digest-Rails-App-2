module DigestGem
  module ApplicationHelper
    # Returns `num` groups of array `arr` where items are rotated such that
    # the first group contains the first item, the 0 + 1 * num item, the
    # 0 + 2 * num item, etc.  Similar to `in_groups`, except for item order.
    def rotate_in_groups(arr, num)
      (0..num - 1).to_a.map do |start_i|
        (0..(arr.size / num).ceil).to_a.map do |i|
          arr[start_i + (i * num)]
        end
      end
    end
  end
end
