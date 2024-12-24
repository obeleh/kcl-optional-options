# About

This is just a question I have to see if KCL has something equivalent to pythons `if __name__ == "__main__":` statement.

# Running `a`

```bash
kcl run a -D namespace="bla"
```

Should and does give:

```yaml
metadata:
  namespace: bla
```

# Running `b`

Should give:

```yaml
all_resources:
- metadata:
    namespace: app1
- metadata:
    namespace: app2
```

But it fails with:

```bash
option('namespace') must be initialized, try '-D namespace=?' argument
```

So my question is, is there a way to run `b` without having to provide the `namespace` option?
So far the only solution I can find is to add this to `a/main.k`:

```kcl
if option('a_is_running', default=False):
    {
      **generate_resources(read_options())
    }
```
