# Bag-of-Visual-Words
This is a project I executed for 16720 Computer Vision. Here we use Bag of Words for scene classification. Features are calculated by passing images through a filterbank involving x and y gradient filters, gaussian and laplacian filters and sampling points from Harris corners. These are then used to construct a dictionary using Kmeans. Test images are classified by comparing word frequncy histograms of visual words mapped from the dictionary. 
Please refer to the kgopalak_CV2 for details. 
