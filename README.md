# meta-legend-vcpkg-registry

A [vcpkg](https://github.com/microsoft/vcpkg) registry hosting the meta-legend
C++ libraries. Add the registry once and pull any of these ports:

| Port | Library | CMake target |
|---|---|---|
| `network-ml` | [Network ML](https://github.com/meta-legend/network-ml-library) (REST + LLM chat) | `NetworkML::networkml` |
| `file-ml` | [File ML](https://github.com/meta-legend/file-ml-library) (filesystem utilities) | `FileML::fileml` |

## Using it

In your project, add a `vcpkg-configuration.json` next to your `vcpkg.json`.
List whichever of the packages you need under `packages`:

```json
{
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/meta-legend/meta-legend-vcpkg-registry",
      "baseline": "<latest commit on this repo's main>",
      "packages": [ "network-ml", "file-ml" ]
    }
  ]
}
```

Declare the dependencies in your `vcpkg.json`:

```json
{ "dependencies": [ "network-ml", "file-ml" ] }
```

Then consume them in CMake:

```cmake
find_package(NetworkML CONFIG REQUIRED)
find_package(FileML CONFIG REQUIRED)
target_link_libraries(myapp PRIVATE NetworkML::networkml FileML::fileml)
```

Set `baseline` to the latest commit SHA of this repository's `main` branch
(`git ls-remote https://github.com/meta-legend/meta-legend-vcpkg-registry HEAD`).
