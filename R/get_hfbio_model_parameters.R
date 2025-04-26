# File: R/get_hfbio_model_parameters.R

#' Get Model Parameters from Hugging Face Hub
#'
#' This function downloads and reads the configuration file (config.json)
#' of a Hugging Face model to extract its parameters.
#'
#' @param model_id Character string specifying the model repository id
#' (e.g., "facebook/esm2_t33_650M_UR50D").
#' @return A list containing the model parameters.
#' @export
#'
#' @examples
#' params <- get_hfbio_model_parameters("facebook/esm2_t33_650M_UR50D")
#' print(params)
get_hfbio_model_parameters <- function(model_id) {
    if (!requireNamespace("jsonlite", quietly = TRUE)) {
        stop("The 'jsonlite' package is required but not installed.
             Please install it first.")
    }

    config_path <- download_hfbio_model(model_id, filename = "config.json")
    params <- jsonlite::fromJSON(config_path)

    return(params)
}
