# Checklist

## Pre-Merge

- [ ] Version updated in accordance with [Semver](https://semver.org)
- [ ] Public functions, variables, and objects have doc strings with `@since ...` tags
- [ ] Public functions and objects have unit tests
- [ ] All updated captured in `CHANGELOG.md`
- [ ] CI/CD pipeline passes
- [ ] `dart analyze` and `dart format --fix .` has been run

## Post Merge

- [ ] Tag repository with the latest version. `git tag x.y.z`
- [ ] Push tags to GitHub. `git push -u --tags`
- [ ] New Version published to `pub.dev` via `dart pub publish`
