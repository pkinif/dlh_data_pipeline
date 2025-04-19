
library(pipelineR)
library(DBI)

con <- pipelineR::connect_db()

message("Testing start_pipeline() on a small batch...")

from_jenkins <- sys.getenv("JENKINS_FROM")
to_jenkins <- sys.getenv("JENKINS_TO")
batch_size_jenkins <- as.integer(sys.getenv("JENKINS_BATCH_SIZE"))

pipelineR::start_pipeline(
  from = from_jenkins,
  to = to_jenkins,
  batch_size = batch_size_jenkins
)

message("✅ start_pipeline() completed without crash.")

DBI::dbDisconnect(con)