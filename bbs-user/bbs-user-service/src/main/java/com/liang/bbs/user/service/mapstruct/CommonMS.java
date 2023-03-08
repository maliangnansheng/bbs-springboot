package com.liang.bbs.user.service.mapstruct;

import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * @author maliangnansheng
 * @date 2021-04-20 22:25
 */
public interface CommonMS<P, D> {
    /**
     * po转dto
     *
     * @param p po
     * @return dto
     */
    D toDTO(P p);

    /**
     * dto转po
     *
     * @param d dto
     * @return po
     */
    P toPo(D d);

    /**
     * po转dto
     *
     * @param pList po
     * @return dto
     */
    List<D> toDTO(List<P> pList);

    /**
     * dto转po
     *
     * @param pList dto
     * @return po
     */
    List<P> toPo(List<D> pList);

    /**
     * po转dto
     *
     * @param pageInfo po
     * @return dto
     */
    PageInfo<D> toPage(PageInfo<P> pageInfo);

}
