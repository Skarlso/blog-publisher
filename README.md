# Blog Publisher Action

This action publishes a hugo blogs public folder to a given repositroy.

# Arguments

The repository can be set by providing an `args` to the workflow like this:

```
action "blog-publisher" {
  uses = "skarlso/blog-publisher@master"
  needs = ["blog-builder"]
  secrets = ["GITHUB_TOKEN", "PUSH_TOKEN"]
  args = ["Skarlso/skarlso.github.io.git"]
}
```

# Secret

This action also requires a token which has push access.

The token is named `PUSH_TOKEN` and must be created via `secrets`.

