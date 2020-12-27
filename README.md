# assets.richardwillis.info

After copying files into photos, be sure to run `./scripts/resize-root-images.sh`;

## GitHub Actions

### Secrets

The following secrets need to be set:

- `AWS_ACCESS_KEY_ID`
- `AWS_S3_BUCKET`
- `AWS_SECRET_ACCESS_KEY`

### Resizing and syncing to S3

Images are resized (using ImageMagick) and synced to S3 when a pull request is created.

#### Image breakpoint sizes

*4* breakpoints between *200px* and *1280px*:

- 200
- 725
- 1075
- 1280

I used [https://responsivebreakpoints.com/](https://responsivebreakpoints.com/) to generate the breakpoints.
