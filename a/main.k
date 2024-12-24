
schema GenerateOptions:
    namespace: str


generate_resources = lambda options: GenerateOptions {
   {
       metadata = {
           namespace = options.namespace
       }
   }
}

read_options = lambda {
   {
       namespace = option("namespace", required=True)
   }
}

# Here preferably a condition that detects if the script is imported or ran directly
{
  **generate_resources(read_options())
}