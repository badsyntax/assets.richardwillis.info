# assets.richardwillis.info

## Resizing images locally

```sh
brew install imagemagick webp
```

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

*5* breakpoints between *320px* and *1280px*:

- 320
- 640
- 768
- 1024
- 1280
