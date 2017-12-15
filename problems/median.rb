def find_median(arr1, arr2)
  len = arr1.length + arr2.length
  m_idx = len / 2.0
  idx1 = 0
  idx2 = 0
  current_med = nil

  i = 0
  while i < m_idx
    if arr1[idx1] <= arr2[idx2]
      current_med = arr1[idx1]
      idx1 += 1
    else
      current_med = arr2[idx2]
      idx2 += 1
    end

    i += 1
  end

  if m_idx % 2 == 0
    med2 = arr1[idx1] <= arr2[idx2] ? arr1[idx1] : arr2[idx2]
    current_med = (current_med + med2) / 2.0
  end

  current_med
end

arr1 = [1, 3, 3, 6, 7, 8, 9, 10]
arr2 = [1, 2, 3, 4, 5, 6, 8, 9]
puts find_median(arr1, arr2)
