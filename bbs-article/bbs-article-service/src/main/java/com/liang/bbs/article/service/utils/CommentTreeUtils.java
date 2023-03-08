package com.liang.bbs.article.service.utils;

import com.liang.bbs.article.facade.dto.CommentDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * 用于树转集合，集合转树场景
 *
 * @author maliangnansheng
 * @date 2022-05-22 12:34
 */
@Slf4j
public class CommentTreeUtils {
    /**
     * 集合转树
     *
     * @param commentDTOS
     * @return
     */
    public static List<CommentDTO> toTree(List<CommentDTO> commentDTOS) {
        Map<Integer, CommentDTO> commentDTOMap = commentDTOS.stream().collect(Collectors.toMap(CommentDTO::getId, e -> e));
        List<CommentDTO> root = new ArrayList<>();
        for (CommentDTO dto : commentDTOS) {
            Integer preId = dto.getPreId();
            // 是根评论
            if (preId == 0) {
                // 设置评论深度
                dto.setDepth(0);
                root.add(dto);
            } else {
                CommentDTO parent = commentDTOMap.get(preId);
                // 跳过子级无父级的评论
                if (parent == null) {
                    continue;
                }
                List<CommentDTO> children = CollectionUtils.isEmpty(parent.getChild()) ? new ArrayList<>() : parent.getChild();
                // 设置评论深度
                dto.setDepth(parent.getDepth() + 1);
                children.add(dto);
                parent.setChild(children);
            }
        }
        return root;
    }


}
