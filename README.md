# assets.richardwillis.info

My source assets for richardwillis.info.

Images are generated and synced to S3 by adding a new source image to [./photos](./photos) and sending a PR. 

After copying files into photos, be sure to run `./scripts/resize-root-images.sh`;

## Resizing images locally

You'll need the following deps installed:

```sh
brew install imagemagick webp
```

## GitHub Actions

### Secrets

The following secrets need to be set:

- `AWS_ACCESS_KEY_ID`
- `AWS_S3_BUCKET`
- `AWS_SECRET_ACCESS_KEY`

## Image breakpoint sizes

**5** breakpoints between **320px** and **1280px**:

- 320
- 640
- 768
- 1024
- 1280

## More Info

See https://richardwillis.info/blog/responsive-images
