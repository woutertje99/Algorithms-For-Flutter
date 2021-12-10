library algorithms_for_flutter;

class Algorithms {
  List bubbleSort(List oldList) {
    var temp;
    for (int j = 0; j < oldList.length; j++) {
      for (int i = 1; i < oldList.length - j; i++) {
        if (oldList[i - 1] > oldList[i]) {
          temp = oldList[i];
          oldList[i] = oldList[i - 1];
          oldList[i - 1] = temp;
        }
      }
    }
    return oldList;
  }

  List insertionSort(List oldList) {
    int n = oldList.length;
    for (int j = 1; j < n; j++) {
      int key = oldList[j];
      int i = j - 1;
      while ((i > -1) && (oldList[i] > key)) {
        oldList[i + 1] = oldList[i];
        i--;
      }
      oldList[i + 1] = key;
    }
    return oldList;
  }

  List heapSort(List arr) {
    int n = arr.length;

    // Build heap (rearrange array)
    for (int i = (n / 2 - 1).round(); i >= 0; i--) _heapify(arr, n, i);

    // One by one extract an element from heap
    for (int i = n - 1; i >= 0; i--) {
      // Move current root to end
      int temp = arr[0];
      arr[0] = arr[i];
      arr[i] = temp;

      // call max heapify on the reduced heap
      _heapify(arr, i, 0);
    }
    return arr;
  }

  void _heapify(List arr, int n, int i) {
    int largest = i; // Initialize largest as root
    int l = 2 * i + 1; // left = 2*i + 1
    int r = 2 * i + 2; // right = 2*i + 2

// If left child is larger than root
    if (l < n && arr[l] > arr[largest]) largest = l;

// If right child is larger than largest so far
    if (r < n && arr[r] > arr[largest]) largest = r;

// If largest is not root
    if (largest != i) {
      int swap = arr[i];
      arr[i] = arr[largest];
      arr[largest] = swap;

// Recursively heapify the affected sub-tree
      _heapify(arr, n, largest);
    }
  }
}
