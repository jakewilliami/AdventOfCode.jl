function _mk_cartesian_index(v::I1, n::I2) where {I1 <: Integer, I2 <: Integer}
    return CartesianIndex(ntuple(_ -> v, n))
end
