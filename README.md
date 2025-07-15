README.md written by DeepSeek

其实这半个项目都是用的 DeepSeek 写的，不管了总之能用

# Docusaurus Docker 镜像

本项目提供预构建的 [Docusaurus](https://docusaurus.io/) 文档站点 Docker 镜像，支持开箱即用、持久化存储和国内npm镜像加速。镜像已发布至 [Docker Hub](https://hub.docker.com/r/onesoftqwq/docusaurus)。

## 直接使用预构建镜像

```bash
docker run -it --rm -p 3000:3000 -v /本地/文档目录:/docusaurus onesoftqwq/docusaurus
```

- `-p 3000:3000`：将容器3000端口映射到主机
- `-v /本地/文档目录:/docusaurus`：挂载本地目录实现持久化（**必须替换为实际路径**）
- 首次启动自动初始化 Docusaurus 项目

访问 [http://localhost:3000](http://localhost:3000) 查看站点。

## 构建自定义镜像

### 1. 获取项目文件
```bash
git clone https://github.com/your-repo/docusaurus-docker
cd docusaurus-docker
```

### 2. 构建镜像
```bash
docker build -t my-docusaurus .
```

### 3. 运行容器
```bash
docker run -it --rm -p 3000:3000 -v /本地/文档目录:/docusaurus my-docusaurus
```

## 特性

- **开箱即用**：预装 Docusaurus v2 + TypeScript 模板
- **国内优化**：默认使用 [npmmirror](https://registry.npmmirror.com) 镜像源
- **数据持久化**：通过卷挂载保存所有修改
- **自动初始化**：首次启动自动创建项目结构
- **热重载**：修改文档内容实时生效
- **轻量化**：基于高效 Alpine Linux 基础镜像

## 目录结构

| 容器路径 | 说明 |
|----------|------|
| `/docusaurus` | 文档项目根目录（**必须挂载**） |
| `/docusaurus-files` | 初始化模板（只读） |
| `/entrypoint.sh` | 启动脚本（自动初始化逻辑） |

## 常见问题

### 如何更新文档内容？
直接修改挂载目录中的文件：
```bash
# 挂载目录示例结构
/本地/文档目录
├── docs
├── src
├── static
└── package.json
```

### 如何添加新依赖？
进入容器内操作：
```bash
docker exec -it 容器名 sh
cd /docusaurus
pnpm add 包名
```

### 如何修改站点配置？
编辑挂载目录中的 `docusaurus.config.js`：
```js
module.exports = {
  title: '我的文档站',  // 修改站点标题
  themeConfig: {
    navbar: {
      items: [ /* 导航项 */ ]
    }
  }
}
```

### 如何解决端口冲突？
修改主机端口映射：
```bash
docker run -it --rm -p 8080:3000 ... # 主机8080->容器3000
```

### 如何查看日志？
```bash
docker logs -f 容器名
```

### 问题反馈
如果你在本中项目发现了问题或是遇到了**因为本项目构建的镜像引起的问题**欢迎提交 Issues