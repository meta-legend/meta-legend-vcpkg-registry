# network-ml-vcpkg-registry

A [vcpkg](https://github.com/microsoft/vcpkg) registry hosting the
[`network-ml`](https://github.com/meta-legend/network-ml-library) port.

## Using it

In your project, add a `vcpkg-configuration.json` next to your `vcpkg.json`:

```json
{
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/meta-legend/network-ml-vcpkg-registry",
      "baseline": "<latest commit on this repo's main>",
      "packages": [ "network-ml" ]
    }
  ]
}
```

Declare the dependency in your `vcpkg.json`:

```json
{ "dependencies": [ "network-ml" ] }
```

Then consume it in CMake:

```cmake
find_package(NetworkML CONFIG REQUIRED)
target_link_libraries(myapp PRIVATE NetworkML::networkml)
```

Set `baseline` to the latest commit SHA of this repository's `main` branch.
