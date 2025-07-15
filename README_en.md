[中文版本](https://github.com/OnesoftQwQ/Docusaurus-Docker/blob/master/README.md)

# Docusaurus Docker Image

This project provides pre-configured Docker images for hosting [Docusaurus](https://docusaurus.io/) sites, offering out-of-the-box support and persistent storage. Published on [Docker Hub](https://hub.docker.com/r/onesoftqwq/docusaurus), the images are rebuilt automatically on the 1st of each month.

## Using Pre-built Images

```bash
docker run -it --rm -p 3000:3000 -v /local/docs/directory:/docusaurus onesoftqwq/docusaurus
```

- `-p 3000:3000`: Maps container port 3000 to host
- `-v /local/docs/directory:/docusaurus`: Mounts local directory for persistence (**must replace with actual path**)
- Automatically initializes Docusaurus project on first launch

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

## Features

- **Out-of-the-box**: Pre-installed Docusaurus v3 + TypeScript template
- **Data Persistence**: All modifications saved via volume mount
- **Auto Initialization**: Automatically creates project structure on first launch
- **Hot Reload**: Real-time updates when modifying content
- **Lightweight**: Based on efficient Alpine Linux base image

## Directory Structure

| Container Path | Description |
|----------|------|
| `/docusaurus` | Documentation project root (**must mount**) |
| `/docusaurus-files` | Initialization template (read-only) |
| `/entrypoint.sh` | Startup script (auto-init logic) |

## FAQ

### How to update content?
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
Edit `docusaurus.config.js` in mounted directory:
```js
module.exports = {
  title: 'My Documentation Site',  // Modify site title
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
