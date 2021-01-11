# assets.richardwillis.info

My source assets for https://richardwillis.info.

Images are generated and synced to S3 with GitHub Actions.

## Adding images

- Add new source images to [./photos](./photos)
- Run `./scripts/resize-root-images.sh`
- Send a PR to sync the images

## Resizing images locally

You'll need the following deps installed:

```sh
brew install imagemagick webp
```

Generate images:

```bash
./scripts/generate-responsive-image.sh ./photos/image.jpg
```

## Image breakpoint sizes

**5** breakpoints between **320px** and **1280px**:

- 320
- 640
- 768
- 1024
- 1280

## Secrets

The following secrets need to be set for the CI workflows to run:

- `AWS_ACCESS_KEY_ID`
- `AWS_S3_BUCKET`
- `AWS_SECRET_ACCESS_KEY`

## More Info

See https://richardwillis.info/blog/responsive-images
