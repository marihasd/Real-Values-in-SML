# Programming Assignment 4
# Submitted 16 March 2024 6:20 PM
# 
# Description:
#   This file contains the definition of a function named mymsort, which uses the merge sort algorithm to sort an array of integers.
#   Merge sort is a divide-and-conquer algorithm that recursively divides the input array into halves, sorts each half, and then merges them back together in sorted order.
# 
# Usage:
#   To use this function, include this file in your Ruby script using `require_relative 'mymsort.rb'`.
#   Then call the mymsort function with an array of integers as its argument, e.g.:
#   sorted_array = mymsort([3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5])

def mymsort(arr)
  # Base case: If the array has 1 or fewer elements, it is already sorted
  return arr if arr.length <= 1

  # Divide the array into two halves
  mid = arr.length / 2
  left_half = arr[0...mid]
  right_half = arr[mid..]

  # Recursively sort each half
  merge(mymsort(left_half), mymsort(right_half))
end

# Helper method to merge two sorted arrays
def merge(left, right)
  merged = []

  # Merge the two sorted arrays
  until left.empty? || right.empty?
    if left.first <= right.first
      merged << left.shift
    else
      merged << right.shift
    end
  end

  # Append any remaining elements from the left or right arrays
  merged + left + right
end

# Test function to sort an example array and print the result
def test_mymsort
  example_array = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5]
  sorted_array = mymsort(example_array)
  puts "Sorted Array: #{sorted_array}"
end

# Call the test function to execute the test
test_mymsort
