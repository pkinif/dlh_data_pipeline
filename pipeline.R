message("Starting Pipeline...")
status <- renv::status()
if (isTRUE(status$synchronized)) {
  message("renv: library matches renv.lock; skipping renv::restore().")
} else {
  renv::restore()
}

library(pipelineR)
message("Starting Pipeline...")
batch_size_jenkins <- as.integer(Sys.getenv("JENKINS_BATCH_SIZE"))
message("Batch size: ", batch_size_jenkins)
pipelineR::start_pipeline(
  from = Sys.Date() - 5,
  to = Sys.Date(),
  batch_size = batch_size_jenkins
)
message("✅ start_pipeline() completed without crash.")
