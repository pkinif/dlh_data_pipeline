
library(pipelineR)
library(DBI)

message("Testing start_pipeline() on a small batch...")

batch_size_jenkins <- as.integer(Sys.getenv("JENKINS_BATCH_SIZE"))

message("Batch size: ", batch_size_jenkins)

pipelineR::start_pipeline(
  from = Sys.Date() - 5,
  to = Sys.Date(),
  batch_size = batch_size_jenkins
)


message("✅ start_pipeline() completed without crash.")

DBI::dbDisconnect(con)
