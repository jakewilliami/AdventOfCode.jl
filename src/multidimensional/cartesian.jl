export origin, 𝟘
export abs

_mk_cartesian_index(v::I1, n::I2) where {I1 <: Integer, I2 <: Integer} =
    CartesianIndex(ntuple(_ -> v, n))

"""
```julia
origin(n::Integer) -> CartesianIndex{n}
𝟘(n::Integer) -> CartesianIndex{n}
```

The origin in ℝⁿ.

You can type 𝟘 by typing `\\bbzero<tab>`.
"""
origin(n::I) where {I <: Integer} = _mk_cartesian_index(zero(Int), n)
const 𝟘 = origin

Base.abs(i::CartesianIndex{N}) where {N} = CartesianIndex(abs.(Tuple(i)))
