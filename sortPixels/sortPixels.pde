import java.lang.Math.*;
PImage img;
PImage sortedImg;

void setup() {
    size(800, 264);
    background(55);
    img = loadImage("photo2.jpg");
    sortedImg = createImage(img.width, img.height, RGB);
    sortedImg.loadPixels();
    sortedImg = img.get();
    mergeSort(sortedImg.pixels, sortedImg.pixels.length);
    sortedImg.updatePixels();
}

void draw() {
    image(img, 0, 0);
    image(sortedImg, img.width, 0);
}


void mergeSort(color arr[], int n) 
    { 
        
        int curr_size;
        int left_start; 
                          
        
        for (curr_size = 1; curr_size <= n-1;  
                      curr_size = 2*curr_size) 
        { 
              
            for (left_start = 0; left_start < n-1; 
                        left_start += 2*curr_size) 
            { 
                int mid = min(left_start + curr_size - 1, n - 1);
          
                int right_end = Math.min(left_start  
                             + 2*curr_size - 1, n-1); 
                
                merge(arr, left_start, mid, right_end); 
            } 
        } 
    } 


void merge(color arr[], int l, int m, int r) 
    { 
        int i, j, k; 
        int n1 = m - l + 1; 
        int n2 = r - m; 
      
        color L[] = new color[n1]; 
        color R[] = new color[n2]; 
      
        for (i = 0; i < n1; i++) 
            L[i] = arr[l + i]; 
        for (j = 0; j < n2; j++) 
            R[j] = arr[m + 1+ j]; 
      
        i = 0; 
        j = 0; 
        k = l; 
        while (i < n1 && j < n2) 
        { 
            if (saturation(L[i]) <= saturation(R[j])) 
            { 
                arr[k] = L[i]; 
                i++; 
            } 
            else
            { 
                arr[k] = R[j]; 
                j++; 
            } 
            k++; 
        } 
      
        while (i < n1) 
        { 
            arr[k] = L[i]; 
            i++; 
            k++; 
        } 
      
        while (j < n2) 
        { 
            arr[k] = R[j]; 
            j++; 
            k++; 
        } 
    }