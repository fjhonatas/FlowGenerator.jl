function get_intermediate_vertices(network::Network)
    return [
        vertex for vertex in get_vertices(network) if
        vertex != get_source(network) && vertex != get_sink(network)
    ]
end

function build_vertex_to_outgoing_arcs_map(vertices::Vector{Vertex}, arcs::Vector{Arc})
    num_vertices = length(vertices)
    output = LinkedListMap{Arc}(num_vertices)
    for arc in arcs
        for (tail, _) in get_tail_multiplier_list(arc)
            add_value!(output, tail.index, arc)
        end
    end
    return output
end
