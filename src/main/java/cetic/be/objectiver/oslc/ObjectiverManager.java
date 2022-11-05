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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletContextEvent;
import java.util.List;
import java.util.ArrayList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.eclipse.lyo.oslc4j.core.model.ServiceProvider;
import org.eclipse.lyo.oslc4j.core.model.AbstractResource;
import cetic.be.objectiver.oslc.servlet.ServiceProviderCatalogSingleton;
import cetic.be.objectiver.oslc.ServiceProviderInfo;
import cetic.be.objectiver.oslc.resources.Goal;



// Start of user code imports
// End of user code

// Start of user code pre_class_code
// End of user code

public class ObjectiverManager {

    private static final Logger log = LoggerFactory.getLogger(ObjectiverManager.class);

    
    // Start of user code class_attributes
    // End of user code
    
    
    // Start of user code class_methods
    // End of user code

    public static void contextInitializeServletListener(final ServletContextEvent servletContextEvent)
    {
        
        // Start of user code contextInitializeServletListener
        // TODO Implement code to establish connection to data backbone etc ...
        // End of user code
        
    }

    public static void contextDestroyServletListener(ServletContextEvent servletContextEvent) 
    {
        
        // Start of user code contextDestroyed
        // TODO Implement code to shutdown connections to data backbone etc...
        // End of user code
    }

    public static ServiceProviderInfo[] getServiceProviderInfos(HttpServletRequest httpServletRequest)
    {
    	ServiceProviderInfo[] serviceProviderInfos = new ServiceProviderInfo[1];

		// Start of user code "ServiceProviderInfo[] getServiceProviderInfos(...)"
		// TODO Implement code to return the set of ServiceProviders

		ServiceProviderInfo r1 = new ServiceProviderInfo();
		r1.name = "A sample OBJECTIVER Service Provider 1";
		r1.serviceProviderId = "1";
		serviceProviderInfos[0] = r1;
		// End of user code
		return serviceProviderInfos;
    }

    public static List<Goal> queryGoals(HttpServletRequest httpServletRequest, final String projectId, String where, String prefix, boolean paging, int page, int limit)
    {
        List<Goal> resources = null;
        
        System.out.print("hello---------------");
        // Start of user code queryGoals
        // TODO Implement code to return a set of resources.
        // An empty List should imply that no resources where found.
        // If you encounter problems, consider throwing the runtime exception WebApplicationException(message, cause, final httpStatus)
        // End of user code
        return resources;
    }
    public static Goal createGoal(HttpServletRequest httpServletRequest, final Goal aResource)
    {
        Goal newResource = null;
        
        
        // Start of user code createGoal
        // TODO Implement code to create a resource
        // If you encounter problems, consider throwing the runtime exception WebApplicationException(message, cause, final httpStatus)
        // End of user code
        return newResource;
    }

    public static Goal createGoalFromDialog(HttpServletRequest httpServletRequest, final Goal aResource)
    {
        Goal newResource = null;
        
        
        // Start of user code createGoalFromDialog
        // TODO Implement code to create a resource
        // If you encounter problems, consider throwing the runtime exception WebApplicationException(message, cause, final httpStatus)
        // End of user code
        return newResource;
    }



    public static Goal getGoal(HttpServletRequest httpServletRequest, final String goalId)
    {
        Goal aResource = null;
        
        
        // Start of user code getGoal
        // TODO Implement code to return a resource
        // return 'null' if the resource was not found.
        // If you encounter problems, consider throwing the runtime exception WebApplicationException(message, cause, final httpStatus)
        // End of user code
        return aResource;
    }

    public static Boolean deleteGoal(HttpServletRequest httpServletRequest, final String goalId)
    {
        Boolean deleted = false;
        
        // Start of user code deleteGoal
        // TODO Implement code to delete a resource
        // If you encounter problems, consider throwing the runtime exception WebApplicationException(message, cause, final httpStatus)
        // End of user code
        return deleted;
    }

    public static Goal updateGoal(HttpServletRequest httpServletRequest, final Goal aResource, final String goalId) {
        Goal updatedResource = null;
        
        // Start of user code updateGoal
        // TODO Implement code to update and return a resource
        // If you encounter problems, consider throwing the runtime exception WebApplicationException(message, cause, final httpStatus)
        // End of user code
        return updatedResource;
    }

    public static String getETagFromGoal(final Goal aResource)
    {
        String eTag = null;
        // Start of user code getETagFromGoal
        // TODO Implement code to return an ETag for a particular resource
        // If you encounter problems, consider throwing the runtime exception WebApplicationException(message, cause, final httpStatus)
        // End of user code
        return eTag;
    }

}
