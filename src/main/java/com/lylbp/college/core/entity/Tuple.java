package com.lylbp.college.core.entity;

import lombok.Data;

@Data
public class Tuple<T1, T2> {
    /**
     * The T 1.
     */
    private T1 t1;
    /**
     * The T 2.
     */
    private T2 t2;

    /**
     * Instantiates a new Tuple.
     *
     * @param t1 the t 1
     * @param t2 the t 2
     */
    public Tuple(T1 t1, T2 t2) {
        this.t1 = t1;
        this.t2 = t2;
    }

    public Tuple() {
    }
}
