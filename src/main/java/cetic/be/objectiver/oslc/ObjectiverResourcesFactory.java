// Start of user code Copyright
/*
 * Copyright (c) 2020 Contributors to the Eclipse Foundation
 *
 * See the NOTICE file(s) distributed with this work for additional
 * information regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Distribution License 1.0 which is available at
 * http://www.eclipse.org/org/documents/edl-v10.php.
 *
 * SPDX-License-Identifier: BSD-3-Simple
 */
// End of user code

package cetic.be.objectiver.oslc;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;
import javax.ws.rs.core.UriBuilder;

import org.eclipse.lyo.oslc4j.core.model.Link;
import org.eclipse.lyo.oslc4j.core.OSLC4JUtils;
import cetic.be.objectiver.oslc.resources.Goal;

// Start of user code imports
// End of user code

// Start of user code pre_class_code
// End of user code

public class ObjectiverResourcesFactory {

    // Start of user code class_attributes
    // End of user code
    
    // Start of user code class_methods
    // End of user code

    //methods for Goal resource
    
    public static Goal createGoal(final String goalId)
    {
        return new Goal(constructURIForGoal(goalId));
    }
    
    public static URI constructURIForGoal(final String goalId)
    {
        String basePath = OSLC4JUtils.getServletURI();
        Map<String, Object> pathParameters = new HashMap<String, Object>();
        pathParameters.put("goalId", goalId);
        String instanceURI = "Goals/{goalId}";
    
        final UriBuilder builder = UriBuilder.fromUri(basePath);
        return builder.path(instanceURI).buildFromMap(pathParameters);
    }
    
    public static Link constructLinkForGoal(final String goalId , final String label)
    {
        return new Link(constructURIForGoal(goalId), label);
    }
    
    public static Link constructLinkForGoal(final String goalId)
    {
        return new Link(constructURIForGoal(goalId));
    }
    

}
