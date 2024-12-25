import file

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

print(file.modpath())
if file.modpath().endswith("a"):
    {
      **generate_resources(read_options())
    }