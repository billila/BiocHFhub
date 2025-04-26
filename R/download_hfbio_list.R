#' Download a Model File from Hugging Face Hub
#'
#' This function downloads a specific file from a Hugging Face model repository
#' using the hfhub package. It is mainly used to retrieve model weights or configuration files.
#'
#' @param model_id Character string specifying the model repository id (e.g., "facebook/esm2_t33_650M_UR50D").
#' @param filename Character string specifying the file to download (default is "config.json").
#' @return Path to the downloaded file.
#' @export
#'
#' @examples
#' path <- download_hfbio_model("facebook/esm2_t33_650M_UR50D", "config.json")
#' print(path)
download_hfbio_model <- function(model_id, filename = "config.json") {
  if (!requireNamespace("hfhub", quietly = TRUE)) {
    stop("The 'hfhub' package is required but not installed. Please install it first.")
  }

  file_path <- hfhub::hub_download(repo_id = model_id, filename = filename)
  return(file_path)
}
