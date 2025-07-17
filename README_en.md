[中文版本](https://github.com/OnesoftQwQ/Docusaurus-Docker/blob/master/README.md)

# Docusaurus Docker Image

This project provides automatically pre-built [Docusaurus](https://docusaurus.io/) documentation site Docker images, supporting out-of-the-box usage and persistent storage. The images have been published to [Docker Hub](https://hub.docker.com/r/onesoftqwq/docusaurus) and are automatically built on the 1st of each month.

## Features

- **Out-of-the-box**: Pre-installed Docusaurus v3 + TypeScript template
- **Data persistence**: Save all modifications through volume mounting
- **Auto-initialization**: Automatically creates project structure on first launch
- **Hot reload**: Real-time updates when modifying documentation content
- **Lightweight**: Based on efficient Alpine Linux base image

## Using Pre-built Images

```bash
docker run -it --rm -p 3000:3000 -v /local/docs/directory:/docusaurus onesoftqwq/docusaurus
```

- `-p 3000:3000`: Maps container port 3000 to host
- `-v /local/docs/directory:/docusaurus`: Mounts local directory for persistence (**must replace with actual path**)
- You can place a pre-made Docusaurus project directly into the mounted directory after container creation, and the container will automatically start the project upon launch
- If the mounted directory is empty, an empty Docusaurus project will be automatically initialized and run at startup

Visit [http://localhost:3000](http://localhost:3000) to view the site.

## Building Custom Images

### 1. Get Project Files
```bash
git clone https://github.com/your-repo/docusaurus-docker
cd docusaurus-docker
```

### 2. Build Image
```bash
docker build -t my-docusaurus .
```

### 3. Run Container
```bash
docker run -it --rm -p 3000:3000 -v /local/docs/directory:/docusaurus my-docusaurus
```

## Directory Structure

| Container Path | Description |
|----------|------|
| `/docusaurus` | Documentation project root (**must mount**) |
| `/docusaurus-files` | Initialization template (read-only) |
| `/entrypoint.sh` | Startup script (auto-init logic) |

## FAQ

### How to update documentation content?
Modify files directly in the mounted directory:
```bash
# Example mounted directory structure
/local/docs/directory
├── docs
├── src
├── static
└── package.json
```

### How to add new dependencies?
Operate inside the container:
```bash
docker exec -it container_name sh
cd /docusaurus
pnpm add package_name
```

### How to modify site configuration?
Edit `docusaurus.config.ts` in the mounted directory:
```ts
const config: Config = {
  title: 'My Site',  // Modify site title
  themeConfig: {
    navbar: {
      items: [ /* Navigation items */ ]
    }
  }
}
```

### How to resolve port conflicts?
Modify host port mapping:
```bash
docker run -it --rm -p 8080:3000 ... # Host 8080 -> Container 3000
```

### How to view logs?
```bash
docker logs -f container_name
```

### Issue Reporting
If you discover issues with this project or encounter **problems caused by images built from this project**, please submit Issues
