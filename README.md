# Blog Publisher Action

This action publishes a hugo blogs public folder to a given repositroy.

# Arguments

The repository can be set by providing an `args` to the workflow like this:

```
action "blog-builder" {
  uses = "skarlso/blog-builder@master"
  secrets = ["GITHUB_TOKEN"]
  args = ["Skarlso/skarlso.github.io.git"]
}
```

