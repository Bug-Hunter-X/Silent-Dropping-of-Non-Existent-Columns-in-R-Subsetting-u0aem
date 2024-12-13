```r
# Solution 1: Using %in%

df <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols_to_select <- c("A", "B", "D")
selected_cols <- intersect(cols_to_select, names(df))
subset_df <- df[, selected_cols]

#Solution 2: Using tryCatch to handle errors

df <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols_to_select <- c("A", "B", "D")

subset_df <- tryCatch({df[, cols_to_select]}, error = function(e){ 
  message("Error subsetting data frame:", e)
  return(NULL) # Or handle the error in a more appropriate way
})

# Solution 3:  Explicitly checking for column existence

df <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols_to_select <- c("A", "B", "D")

missing_cols <- setdiff(cols_to_select, names(df))
if (length(missing_cols) > 0) {
  warning(paste("Columns not found:", paste(missing_cols, collapse = ", ")))
  # Handle missing columns appropriately, e.g., add them with NAs or stop execution
} else {
  subset_df <- df[, cols_to_select]
}
```