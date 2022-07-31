{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "ce49a2e4",
   "metadata": {
    "papermill": {
     "duration": 0.006113,
     "end_time": "2022-07-31T09:15:17.278608",
     "exception": false,
     "start_time": "2022-07-31T09:15:17.272495",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# **Cyclistic Bike-share analysis**\n",
    "## **Introduction –**\n",
    "In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.\n",
    "\n",
    "## Phase 1 : Ask - \n",
    "**Business task-** To identify key factors by which a casual riders took annual subscription and and determine the ways through which Cyclistic can use digital media to influence casual riders to become members.\n",
    "\n",
    "**Stakeholders –** Lily Moreno (Director of marketing), Cyclistic executive team, cyclistic marketing analytics team.\n",
    "\n",
    "**Questions to be addressed –**\n",
    "1. How do annual members and casual riders use Cyclistic bikes differently? \n",
    "2. Why would casual riders buy Cyclistic annual memberships?\n",
    "3. How can Cyclistic use digital media to influence casual riders to become members?\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "00946299",
   "metadata": {
    "papermill": {
     "duration": 0.005502,
     "end_time": "2022-07-31T09:15:17.292061",
     "exception": false,
     "start_time": "2022-07-31T09:15:17.286559",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Phase 2 : Prepare -\n",
    "**Determine the credibility of the data -** \n",
    "\n",
    "* The data has been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement) . This is a public dataset that contain the info of how different customer types are using Cyclistic bikes. \n",
    "* There isn't much of a naming convention as the files are sometimes organized by quarter, or month, or the whole year and their names vary a lot. The naming of the columns also changes and there are some columns added and deleted over the years. Nevertheless the data seems to be in good condition and its first hand data collected by the company itself with lots of entries and with lots of useful data.\n",
    "\n",
    "**Sort and filter the data -**\n",
    "\n",
    "* For this analysis, I'm going to focus on the last 12 months i.e. 2021-2022 period as it's the most relevant period to the business task and it has the more complete data with geo-location coordinates, and types of bike used. So, here's the completes sorting and filtering process-\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "258036d1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:15:17.306463Z",
     "iopub.status.busy": "2022-07-31T09:15:17.304049Z",
     "iopub.status.idle": "2022-07-31T09:15:19.175954Z",
     "shell.execute_reply": "2022-07-31T09:15:19.173152Z"
    },
    "papermill": {
     "duration": 1.882185,
     "end_time": "2022-07-31T09:15:19.179282",
     "exception": false,
     "start_time": "2022-07-31T09:15:17.297097",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.1 ──\n",
      "\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.3.6     \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 0.3.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.7     \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.9\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.0     \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.4.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.2     \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.1\n",
      "\n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\n",
      "\n",
      "Attaching package: ‘lubridate’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    date, intersect, setdiff, union\n",
      "\n",
      "\n",
      "\n",
      "Attaching package: ‘gridExtra’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:dplyr’:\n",
      "\n",
      "    combine\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Adding all the required libraries\n",
    "\n",
    "library(\"tidyverse\")\n",
    "library(\"ggplot2\")\n",
    "library(\"lubridate\")\n",
    "library(\"geosphere\")\n",
    "library(\"gridExtra\") \n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "87aa08f7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:15:19.230619Z",
     "iopub.status.busy": "2022-07-31T09:15:19.193499Z",
     "iopub.status.idle": "2022-07-31T09:17:11.810047Z",
     "shell.execute_reply": "2022-07-31T09:17:11.808089Z"
    },
    "papermill": {
     "duration": 112.629194,
     "end_time": "2022-07-31T09:17:11.814390",
     "exception": false,
     "start_time": "2022-07-31T09:15:19.185196",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Now loading the data of last 12 months \n",
    "\n",
    "tripdata_2021_06 <- read.csv(\"../input/cyclistic-tripdata/202106-divvy-tripdata/202106-divvy-tripdata.csv\")\n",
    "tripdata_2021_07 <- read.csv(\"../input/cyclistic-tripdata/202107-divvy-tripdata/202107-divvy-tripdata.csv\")\n",
    "tripdata_2021_08 <- read.csv(\"../input/cyclistic-tripdata/202108-divvy-tripdata/202108-divvy-tripdata.csv\")\n",
    "tripdata_2021_09 <- read.csv(\"../input/cyclistic-tripdata/202109-divvy-tripdata/202109-divvy-tripdata.csv\")\n",
    "tripdata_2021_10 <- read.csv(\"../input/cyclistic-tripdata/202110-divvy-tripdata/202110-divvy-tripdata.csv\")\n",
    "tripdata_2021_11 <- read.csv(\"../input/cyclistic-tripdata/202111-divvy-tripdata/202111-divvy-tripdata.csv\")\n",
    "tripdata_2021_12 <- read.csv(\"../input/cyclistic-tripdata/202112-divvy-tripdata/202112-divvy-tripdata.csv\")\n",
    "tripdata_2022_01 <- read.csv(\"../input/cyclistic-tripdata/202201-divvy-tripdata/202201-divvy-tripdata.csv\")\n",
    "tripdata_2022_02 <- read.csv(\"../input/cyclistic-tripdata/202202-divvy-tripdata/202202-divvy-tripdata.csv\")\n",
    "tripdata_2022_03 <- read.csv(\"../input/cyclistic-tripdata/202203-divvy-tripdata/202203-divvy-tripdata.csv\")\n",
    "tripdata_2022_04 <- read.csv(\"../input/cyclistic-tripdata/202204-divvy-tripdata/202204-divvy-tripdata.csv\")\n",
    "tripdata_2022_05 <- read.csv(\"../input/cyclistic-tripdata/202205-divvy-tripdata/202205-divvy-tripdata.csv\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "726eb39c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:17:11.831715Z",
     "iopub.status.busy": "2022-07-31T09:17:11.830018Z",
     "iopub.status.idle": "2022-07-31T09:17:11.912630Z",
     "shell.execute_reply": "2022-07-31T09:17:11.910837Z"
    },
    "papermill": {
     "duration": 0.093168,
     "end_time": "2022-07-31T09:17:11.915451",
     "exception": false,
     "start_time": "2022-07-31T09:17:11.822283",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'ride_id'</li><li>'rideable_type'</li><li>'started_at'</li><li>'ended_at'</li><li>'start_station_name'</li><li>'start_station_id'</li><li>'end_station_name'</li><li>'end_station_id'</li><li>'start_lat'</li><li>'start_lng'</li><li>'end_lat'</li><li>'end_lng'</li><li>'member_casual'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'ride\\_id'\n",
       "\\item 'rideable\\_type'\n",
       "\\item 'started\\_at'\n",
       "\\item 'ended\\_at'\n",
       "\\item 'start\\_station\\_name'\n",
       "\\item 'start\\_station\\_id'\n",
       "\\item 'end\\_station\\_name'\n",
       "\\item 'end\\_station\\_id'\n",
       "\\item 'start\\_lat'\n",
       "\\item 'start\\_lng'\n",
       "\\item 'end\\_lat'\n",
       "\\item 'end\\_lng'\n",
       "\\item 'member\\_casual'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'ride_id'\n",
       "2. 'rideable_type'\n",
       "3. 'started_at'\n",
       "4. 'ended_at'\n",
       "5. 'start_station_name'\n",
       "6. 'start_station_id'\n",
       "7. 'end_station_name'\n",
       "8. 'end_station_id'\n",
       "9. 'start_lat'\n",
       "10. 'start_lng'\n",
       "11. 'end_lat'\n",
       "12. 'end_lng'\n",
       "13. 'member_casual'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"ride_id\"            \"rideable_type\"      \"started_at\"        \n",
       " [4] \"ended_at\"           \"start_station_name\" \"start_station_id\"  \n",
       " [7] \"end_station_name\"   \"end_station_id\"     \"start_lat\"         \n",
       "[10] \"start_lng\"          \"end_lat\"            \"end_lng\"           \n",
       "[13] \"member_casual\"     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Take a look at the columns to look for consistency\n",
    "colnames(tripdata_2021_06)\n",
    "colnames(tripdata_2021_07)\n",
    "colnames(tripdata_2021_08)\n",
    "colnames(tripdata_2021_09)\n",
    "colnames(tripdata_2021_10)\n",
    "colnames(tripdata_2021_11)\n",
    "colnames(tripdata_2021_12)\n",
    "colnames(tripdata_2022_01)\n",
    "colnames(tripdata_2022_02)\n",
    "colnames(tripdata_2022_03)\n",
    "colnames(tripdata_2022_04)\n",
    "colnames(tripdata_2022_05)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "0d12314e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:17:11.935147Z",
     "iopub.status.busy": "2022-07-31T09:17:11.933482Z",
     "iopub.status.idle": "2022-07-31T09:17:27.670483Z",
     "shell.execute_reply": "2022-07-31T09:17:27.668570Z"
    },
    "papermill": {
     "duration": 15.749765,
     "end_time": "2022-07-31T09:17:27.673468",
     "exception": false,
     "start_time": "2022-07-31T09:17:11.923703",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# The column names in all dataframes are similar. So, Joinning all the datasets together\n",
    "\n",
    "tripdata <- bind_rows(tripdata_2021_06, tripdata_2021_07, tripdata_2021_08, tripdata_2021_09, tripdata_2021_10,\n",
    "                       tripdata_2021_11, tripdata_2021_12, tripdata_2022_01, tripdata_2022_02, tripdata_2022_03,\n",
    "                       tripdata_2022_04, tripdata_2022_05 )"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "cc016746",
   "metadata": {
    "papermill": {
     "duration": 0.008155,
     "end_time": "2022-07-31T09:17:27.689465",
     "exception": false,
     "start_time": "2022-07-31T09:17:27.681310",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Phase 3 : Process - \n",
    "* I will use R language to process and analze our data because Excel can't handle such large amount of data efficiently. Also R will be helpful for creating some insight generating visualizations.\n",
    "* I will start with cleaning data with possible errors like NA and also add some new columns based on calculations of already existing columns in order to facilitate our analysis and arrive at more insightful conclusions."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "4d461f9a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:17:27.708920Z",
     "iopub.status.busy": "2022-07-31T09:17:27.707289Z",
     "iopub.status.idle": "2022-07-31T09:17:31.828172Z",
     "shell.execute_reply": "2022-07-31T09:17:31.826329Z"
    },
    "papermill": {
     "duration": 4.133607,
     "end_time": "2022-07-31T09:17:31.830935",
     "exception": false,
     "start_time": "2022-07-31T09:17:27.697328",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \" GLIMPSE \"\n",
      "Rows: 5,860,776\n",
      "Columns: 13\n",
      "$ ride_id            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"99FEC93BA843FB20\", \"06048DCFC8520CAF\", \"9598066F68…\n",
      "$ rideable_type      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"electric_bike\", \"electric_bike\", \"electric_bike\", …\n",
      "$ started_at         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2021-06-13 14:31:28\", \"2021-06-04 11:18:02\", \"2021…\n",
      "$ ended_at           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2021-06-13 14:34:11\", \"2021-06-04 11:24:19\", \"2021…\n",
      "$ start_station_name \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ start_station_id   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ end_station_name   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"Michigan Ave &…\n",
      "$ end_station_id     \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"13042\", \"\", \"\"…\n",
      "$ start_lat          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.80, 41.79, 41.80, 41.78, 41.80, 41.78, 41.79, 41…\n",
      "$ start_lng          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.59, -87.59, -87.60, -87.58, -87.59, -87.58, -87…\n",
      "$ end_lat            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.80000, 41.80000, 41.79000, 41.80000, 41.79000, 4…\n",
      "$ end_lng            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.6000, -87.6000, -87.5900, -87.6000, -87.5900, -…\n",
      "$ member_casual      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"member\", \"member\", \"member\", \"member\", \"member\", \"…\n",
      "[1] \" SUMMARY \"\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:5860776     Length:5860776     Length:5860776     Length:5860776    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id   end_station_name   end_station_id    \n",
       " Length:5860776     Length:5860776     Length:5860776     Length:5860776    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.64   Min.   :-87.84   Min.   :41.39   Min.   :-88.97  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :45.64   Max.   :-73.80   Max.   :42.17   Max.   :-87.49  \n",
       "                                  NA's   :5036    NA's   :5036    \n",
       " member_casual     \n",
       " Length:5860776    \n",
       " Class :character  \n",
       " Mode  :character  \n",
       "                   \n",
       "                   \n",
       "                   \n",
       "                   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Having a quick look at the data\n",
    "print(\" GLIMPSE \")\n",
    "glimpse(tripdata)\n",
    "print(\" SUMMARY \")\n",
    "summary(tripdata)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "19c0dd53",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:17:31.851409Z",
     "iopub.status.busy": "2022-07-31T09:17:31.849814Z",
     "iopub.status.idle": "2022-07-31T09:18:54.144458Z",
     "shell.execute_reply": "2022-07-31T09:18:54.142339Z"
    },
    "papermill": {
     "duration": 82.308933,
     "end_time": "2022-07-31T09:18:54.148375",
     "exception": false,
     "start_time": "2022-07-31T09:17:31.839442",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Now cleaning the data to be able to properly work with it:\n",
    "\n",
    "#Fist droppiong all NA:\n",
    "\n",
    "tripdata_clean <- drop_na(tripdata)\n",
    "\n",
    "#Then lets create some new columns.\n",
    "\n",
    "#First lets separate the dates into month, day, year and day of the week:\n",
    "\n",
    "tripdata_clean$date <- as.Date(tripdata_clean$started_at) \n",
    "tripdata_clean$month <- format(as.Date(tripdata_clean$date), \"%b\")\n",
    "tripdata_clean$day <- format(as.Date(tripdata_clean$date), \"%d\")\n",
    "tripdata_clean$year <- format(as.Date(tripdata_clean$date), \"%Y\")\n",
    "tripdata_clean$day_of_week <- format(as.Date(tripdata_clean$date), \"%A\")\n",
    "\n",
    "#Then lets make some useful new columns with the duration of the ride, distance traveled, and speed:\n",
    "\n",
    "#First the ride lenght in seconds:\n",
    "tripdata_clean$ride_length <- difftime(tripdata_clean$ended_at,tripdata_clean$started_at)\n",
    "\n",
    "#Then the ride distance traveled in km\n",
    "tripdata_clean$ride_distance <- distGeo(matrix(c(tripdata_clean$start_lng, tripdata_clean$start_lat), ncol = 2),\n",
    "                                         matrix(c(tripdata_clean$end_lng, tripdata_clean$end_lat), ncol = 2))\n",
    "tripdata_clean$ride_distance <- tripdata_clean$ride_distance/1000\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "606c17dd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:18:54.172515Z",
     "iopub.status.busy": "2022-07-31T09:18:54.170853Z",
     "iopub.status.idle": "2022-07-31T09:18:57.286363Z",
     "shell.execute_reply": "2022-07-31T09:18:57.284445Z"
    },
    "papermill": {
     "duration": 3.129148,
     "end_time": "2022-07-31T09:18:57.289451",
     "exception": false,
     "start_time": "2022-07-31T09:18:54.160303",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[1] \" GLIMPSE \"\n",
      "Rows: 5,855,740\n",
      "Columns: 20\n",
      "$ ride_id            \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"99FEC93BA843FB20\", \"06048DCFC8520CAF\", \"9598066F68…\n",
      "$ rideable_type      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"electric_bike\", \"electric_bike\", \"electric_bike\", …\n",
      "$ started_at         \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2021-06-13 14:31:28\", \"2021-06-04 11:18:02\", \"2021…\n",
      "$ ended_at           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2021-06-13 14:34:11\", \"2021-06-04 11:24:19\", \"2021…\n",
      "$ start_station_name \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ start_station_id   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\",…\n",
      "$ end_station_name   \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"Michigan Ave &…\n",
      "$ end_station_id     \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"\", \"13042\", \"\", \"\"…\n",
      "$ start_lat          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.80, 41.79, 41.80, 41.78, 41.80, 41.78, 41.79, 41…\n",
      "$ start_lng          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.59, -87.59, -87.60, -87.58, -87.59, -87.58, -87…\n",
      "$ end_lat            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 41.80000, 41.80000, 41.79000, 41.80000, 41.79000, 4…\n",
      "$ end_lng            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m -87.6000, -87.6000, -87.5900, -87.6000, -87.5900, -…\n",
      "$ member_casual      \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"member\", \"member\", \"member\", \"member\", \"member\", \"…\n",
      "$ date               \u001b[3m\u001b[90m<date>\u001b[39m\u001b[23m 2021-06-13, 2021-06-04, 2021-06-04, 2021-06-03, 20…\n",
      "$ month              \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Jun\", \"Jun\", \"Jun\", \"Jun\", \"Jun\", \"Jun\", \"Jun\", \"J…\n",
      "$ day                \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"13\", \"04\", \"04\", \"03\", \"04\", \"03\", \"10\", \"10\", \"10…\n",
      "$ year               \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"2021\", \"2021\", \"2021\", \"2021\", \"2021\", \"2021\", \"20…\n",
      "$ day_of_week        \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"Sunday\", \"Friday\", \"Friday\", \"Thursday\", \"Friday\",…\n",
      "$ ride_length        \u001b[3m\u001b[90m<drtn>\u001b[39m\u001b[23m 163 secs, 377 secs, 359 secs, 1550 secs, 248 secs,…\n",
      "$ ride_distance      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0.8310969, 1.3872521, 1.3872521, 2.7745801, 1.11069…\n",
      "[1] \" SUMMARY \"\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "   ride_id          rideable_type       started_at          ended_at        \n",
       " Length:5855740     Length:5855740     Length:5855740     Length:5855740    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       " start_station_name start_station_id   end_station_name   end_station_id    \n",
       " Length:5855740     Length:5855740     Length:5855740     Length:5855740    \n",
       " Class :character   Class :character   Class :character   Class :character  \n",
       " Mode  :character   Mode  :character   Mode  :character   Mode  :character  \n",
       "                                                                            \n",
       "                                                                            \n",
       "                                                                            \n",
       "   start_lat       start_lng         end_lat         end_lng      \n",
       " Min.   :41.64   Min.   :-87.84   Min.   :41.39   Min.   :-88.97  \n",
       " 1st Qu.:41.88   1st Qu.:-87.66   1st Qu.:41.88   1st Qu.:-87.66  \n",
       " Median :41.90   Median :-87.64   Median :41.90   Median :-87.64  \n",
       " Mean   :41.90   Mean   :-87.65   Mean   :41.90   Mean   :-87.65  \n",
       " 3rd Qu.:41.93   3rd Qu.:-87.63   3rd Qu.:41.93   3rd Qu.:-87.63  \n",
       " Max.   :45.64   Max.   :-73.80   Max.   :42.17   Max.   :-87.49  \n",
       " member_casual           date               month               day           \n",
       " Length:5855740     Min.   :2021-06-01   Length:5855740     Length:5855740    \n",
       " Class :character   1st Qu.:2021-07-29   Class :character   Class :character  \n",
       " Mode  :character   Median :2021-09-23   Mode  :character   Mode  :character  \n",
       "                    Mean   :2021-10-25                                        \n",
       "                    3rd Qu.:2022-01-14                                        \n",
       "                    Max.   :2022-05-31                                        \n",
       "     year           day_of_week        ride_length       ride_distance     \n",
       " Length:5855740     Length:5855740     Length:5855740    Min.   :   0.000  \n",
       " Class :character   Class :character   Class :difftime   1st Qu.:   0.891  \n",
       " Mode  :character   Mode  :character   Mode  :numeric    Median :   1.611  \n",
       "                                                         Mean   :   2.169  \n",
       "                                                         3rd Qu.:   2.846  \n",
       "                                                         Max.   :1192.246  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Again have a look at the data\n",
    "print(\" GLIMPSE \")\n",
    "glimpse(tripdata_clean)\n",
    "print(\" SUMMARY \")\n",
    "summary(tripdata_clean)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "88dab40a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:18:57.311280Z",
     "iopub.status.busy": "2022-07-31T09:18:57.309591Z",
     "iopub.status.idle": "2022-07-31T09:19:03.517122Z",
     "shell.execute_reply": "2022-07-31T09:19:03.515144Z"
    },
    "papermill": {
     "duration": 6.221246,
     "end_time": "2022-07-31T09:19:03.519702",
     "exception": false,
     "start_time": "2022-07-31T09:18:57.298456",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# As we can see that the min. ride speed is negetive. So, these need to be removed.\n",
    "\n",
    "tripdata_clean <- tripdata_clean[!(tripdata_clean$ride_length<0),]"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a65d8d3d",
   "metadata": {
    "papermill": {
     "duration": 0.014101,
     "end_time": "2022-07-31T09:19:03.542474",
     "exception": false,
     "start_time": "2022-07-31T09:19:03.528373",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Phase 4 : Analyze -\n",
    "* Now I will analyze the data usinf some statistical measures and make some visualizations in order to drive some insights from the data "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "d2230d82",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:19:03.563923Z",
     "iopub.status.busy": "2022-07-31T09:19:03.562401Z",
     "iopub.status.idle": "2022-07-31T09:19:10.290615Z",
     "shell.execute_reply": "2022-07-31T09:19:10.288614Z"
    },
    "papermill": {
     "duration": 6.741921,
     "end_time": "2022-07-31T09:19:10.293364",
     "exception": false,
     "start_time": "2022-07-31T09:19:03.551443",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAA0gAAANICAIAAAByhViMAAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdd2AT9f/H8fcladKmu7RAW3YpexUF2aDIF1FERBEcLAWZKrIVVJZbhixBHOgP\nFHAgoIAyRBBQmSoFyh4CCrRQ6G6T/P5IKaXz2jRNe30+/sp9crm876736Ss3FZvNJgAAACj9\ndK4uAAAAAEWDYAcAAKARBDsAAACNINgBAABoBMEOAABAIwh2AAAAGkGwAwAA0AiCHQAAgEaU\noWBns8bXMhsVRdHpjXviUl1dTomz96UmiqJ0+eVC3qPNCvNXFGXd1SQnleHs6aukcmkUledC\nvRVFOZKYVuRTTo3fryiKoii5jbDt8XBFUZq8tLfIvxrOQD+Wt5LZjxVzf+JCdGUlQRkKdtF/\nTziWmCoiNmvquG9Pu7oclCA2a/yOHTt+33PO1YWURSz8AqEfKwvYKEqjkrPWylCw2zrmOxEJ\nub+GiOx77VNXl1PiVOs5bcmSJaPr+Lu6EBdISzzapk2b/z2yOKOlLC+NYpZ94SMP9GN5K5lb\nbkGrYqMojUrOWjO4uoBiYk2LGbn9oqLoPvzw655V7rh+5p1fr09u42N0dV0lSLmmD/Zr6uoi\nSgyWBkog+rF8lcwtt2RWBa0qK3vsLu0edT7Z4l155AOhEZNr+dtslpeWnyym77YlX0q1FtN3\nFUIJL69wSsRMWeOTiv5Ek9LKaWvEmpJksTljwiUR/ViuSnh5rkEX5ASloSsrK8HuxzE/iUjT\nKYNFpOf0ZiLy5/RFmUdY1726oih3vvlnlg+e3/yYoigBtadktJz59Yv+3TuElvc3mf3CGzYb\nNmXh8YTbNp4ji1orijLixLW4M+t6t63nZTT/36UE+1s2S+wXM8Z0bF6vnK+nwegRVLlWlyef\n//FIbLZ6Levnv9SuQXVvk3v5ynX7j/8o0Sr1PY3ewYOyjJdvMdnlVt6BKXdkOb3Xmnpp8SuD\nm9Wq7GUyBYbU6DFo4t/XUnKcZiHKUDn9XUPrKYryyOHozI02S6yiKJ5BPfOdKVGxzJfXDTR6\nNRWR62enKYpSrvanOS4NEesvS9/s1q5RkJ+X0dO3eoNWw15bfCHZkrmwY5+1UxTlmWNX9/zf\nxAaV/Lw83Awmz+qN2k5atDHfpSEiNpt1w7wJbetV83Y3+pev1PHRZ7//69aMn151v6Io1br9\nkOVThxe0VhSlztNb1XyFGjEHf3j+8ftqBpczuRl9y1Vq23XA8t//zTKOI1tBZtkXvprZfC7U\n280jLPVG5IsPtfQ1e7rpDf4VKnd+fMTmY9ezf0VGqQ4skpKCfizf8kpmP5a9qjy2shx7JFG3\n2AvQBdnSNn40+b4WdQO83T39yje5u8fMr/cUyQIRujInd2X5rw5bGWBJ/qecm17RmfbdSLHZ\nbClxf5l0iqLoNl1Nyhgn5sgEEfGs+EyWzy6ICBKRR9adtQ/umtVXryiKolSoVq/1XY0DPQ0i\n4hl6z+b/EjI+cnhhKxEZuO/HJj5Gjwq17r3/wdXRiTabzZp2fVDz8iKiM/g1vrNl+1bNqvmb\nRERvDF5zOSHzl87v20BEFJ17rYiWdSoHiEhoh2GVTQavigMzj6ammOxyK2//5KYict/W8/bR\n0pJO96rrLyKKolSo0bBOqK+IuAe07lfBU0R+iEl0sAyV0985pK6I9Dh0JfNnrWnXRMQc+GiR\nLPMDM6eOGz1AREw+rSdMmDB1xp7sS8Nms73fp3FGte1a3unvphcR35rdIuNTM8Y5uqStiHR8\nr7+iKJ7BNTs++FCbptXsG1rX9//OY2mMCPESkdcHRYiIm1eFJhG1PQ06EdEZfKb99I99nNT4\nSA+d4maum2i57bPPhniJyPzzN3Kcckrcvry39F961xSRxhP22Acv753pZ9CJSECN+m3at6lX\nzVdEdHqvOYdiMj7iyFaQRfaFr2Y2R4R46Y3BfWv5iYjBHNQ4oo6XQSciemP5uX9cyvypzKXm\ntgRKC/qxzEpXP5alqry3shx7JJWLXXUXlPZmzzr2L41o0bZZw3CDoohIuzHfOrhA6MqKoSvL\nd3WUiWD3z6aeIhJQ562Mlmnh/iLS4v2Dt0ayJjf1MorI+kybelriCW+9Tm8K/S/FYrPZYk8u\nMOkUo1fDDzcdt49gSb3ywYgWIuJb89mMdWf/Oyhf3euel75IsFgzpnb+554i4l3l0SMx6R2x\nNe3GogG1RKThmD8yRju3/lkR8Q3rdSA6fbSj69721utEJHOHqLKY7HIrL0vX891T4SLiG/bw\nL6di0wv77Yu6Zjf7ppXRYRW6DJXTL1CwK/Qyt3cZPlVeyW1pnPrmKREx+TZb/Vd6JSk3jo7q\nECwiVbt+lvEpe68qIq1HfZ6xMW+b001EPMo9mPvCSO8NFUU/aN5PKVabzWazJF+eP7yliLiZ\n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\nn6pjW3hn3cFr9Gn1fCUvEXlrflRGo2fwsw8HesSeenP3v7umnbgWUHf6rbu6K27ja/tZUi5N\n/P3S7VOyjmgcFhwcvDo6r+dJ2yyxKy8lGExVZj5+Z+b260cPZR5084p4NNCcHLt98bkbmdv3\nvrXytsk5Vky+vCu9GOCmu3bi5Y23Tyfm7ze2xSY7Xoba6d8U/99to53/6Q01c6FymedL7x7W\nt4I5LfH4+N/+y9yelnh01L4ris44unbR3CNtxbgNtzdYZz+3Q0Q6jK2X0WTft58cu33Kz2P/\nuJFSsfWcyqYcf77epPOwXx026v0cno0df2HtuKNXRWTwPSEiknBpaXh4eKMWozJG0HuU/1+f\nl+eE+9tsto1Xk5z9h5dBzWx+O/r72xtsc5/fKSJNR9cXyeOPs/ShHyucktaP2eW/lWVTVF2Z\nnTno8QaebvEXF/5wJTFz+8kvBz/11FMvLf/H8fVCV5bBmV1Z7qWqjoCl0kvVfUWk3SdROb4b\nOaelZLu+et+rESIS3jtMRJ7YctsPrEu7J4qI0avRl7+nX5xiTbv++egOIuJf6/mM0XIJ+Bb7\nyTEfH7yVzf/4akZts5uIhLZfn9F4YsWTIuJXu8+h2PRrLU9snOlr0IuIV/CzBS0mOzW/dG02\n29q+tUTEr1bPnefSr7iJObSuTbn0HekZv0QLXYbK6R+a31JE/GoN/Dcl/ZqkmMhV9T3dRNUe\nO7XL3P5Lyzv0hdyWxskVvUXE5HfXD4fSTwpOjTsx5p4QEaly/60LmhzcY6co+uEfbrXPpyU1\nZtELbUTEI+i+uNuvsT/5zX0i4ubjJiLP37xuIw///TZRpyiKYug56r2/b97dwGqJ37Fq7p0B\n7iJS+b756csr5b9AN72i6F/57tYtry4fXFvLw01RDFuuJdkc3QpykH3h5zubGYvr2QWb7D9+\nranXPh59t4gYvSIy/lSyl1pK0Y9lV7r6scxVqdnKsm0Uahe7yi5o79TWIhJQv89fV9JvnhJz\n8PvaZjdFUWaejHVkgdCVFU9Xlvfq0HKwS47drlcURdHviM15z21idPotoT/7Lz6jMeHyV/ZG\ng3v16GyXQa4a18n+brVGzTve3Tos0F1ETL4R6/69NYXc/g52vtpeRHR6zzb/e/Cx7vc1rlVB\np/d6fPwEEdEbg/sPHZ5xj5yF/RqJiM7Nu0Hzdg1rVBCRrtM/EBHvymMLWkx2KjvEtKTTj9Xx\ns//NhdaKaFyzoqIoJr/m7/cPl9tv7Fm4MlROPzl2RzV3g4i4B9a7/+Gedzdv4KFTjF6NGnq6\nqTkUq3KZW1KvmHSKorh1fqT3MyM2ZV8aNpt15pMN7dVWqt20XbN69ttI+tZ86HBC1hsUFy7Y\nGUxVWpX3EBGTX2izZg18jXoRMbhX++xQ1uvLUuMPuusUETF6NUnM9xJ8m81ms/066xmzXmev\nv0Ll6rXCqvnd/NVYo9OIi8m3prJryv/s7eVrNr7n3o7NGtXUKYqI3Dvhx4xxHNkKssu+8POd\nzfRLyfq3EhGjb+idzRv6m/QioncrN+PX225Jk7lUVUuq5KEfy1Hp6seyVJXvVpZ9o1C52FV2\nQVZL/Jh7K4uIoveo1aR16zvq27e1ls+tdHCB0JUVQ1eW7+rQcrA79EFrEfGpOi6PcQZU9JRM\nF0jbPVPRU0TCHtuQ40f2r5nfs1PzIH8vg5t7hRqNnnjh9cjbr9DO/e/A8v3741vWr+Jh1Hv5\nl2/1wFPf/RVts9nm9Wvv627wLFf5etrN/teaunbOuPtaN/Y1mUNrtXzlk52JMetExC9sdkGL\nyU5lh2iz2SzJFz94edAd4aGeRoNvUGiXPqP3xyT9PrJBlg6xcGWon/7VQ2sHdG1V3if9R7BX\n5bZfRl59NNCsJtipX+a/vDWoanlfncFYq/3KHJeGzWbZ/Nn0B1o3CPD2MLh7V6nbYsiri84n\n37aZOhLsTD6tU+OOvzeqb6NqFT3c3PwrVO3ad/SOcznfL+qtOgEiUvuZX/KYZhYxkZtfGfL4\nnXWr+nq5640egcE1Onbv+8G3O7J3pzuWvdOtbdMgX0+9zuAdENLqf73nf7c/yzgObAU5yLLw\n851Ne2+4Ly5l+6JxLetU9jQafAJDOvYcsj4y63+OzKWqqaQEoh/LUenqx7JXle9Wlm2jULXY\n1XdBVkvCt++P69Ckho+Hm8nTt0Gr+976fFvWhVnwBUJXVgxdWb6rQ7HZyswDtEuJmH8vJFps\nFUJCM99c49rx0f7hM6s/tPnkd/e4rjQXS4uPPnU+oUatynmeiFEmjKrmO+vM9Q/Oxw0J8XR1\nLU6U22w+F+o970LcvriUCE83V9WGvNGPQQ26Mmd0ZRq/eKI0WtKuQaVKlaafvO3Rzrumfy8i\nzV+s46KiSgSDZ7lwUp1IwqXls85cNwf11nZXWEZmU6vox5CvMrKNF/9sEuxKnEfefUBEZt77\n9A97TyakWuKvnls157mH/++Yya/dvFYVXV0dXCn+elJa4uW3u48UkWavverqcpyljMymttGP\nIQ9lZBt32WyqOWyM4mX99IXOutvv8OgZ2vzLv7Pe6gZljf2EDBHxCGp7IVndycalUL6zmXFi\nSvHXBtXox5ArurLMIxR5V6b9J0+UQkr/2RvuH7T16x9+OXnxmtEnoO4dbbs/0N67sM8zgGbc\n2blN/d8uVo24d+Ls6cFGze5uz3c2n3hvfpOE1Cp53/UKLkY/hlzRldk5qSvj4gkAAACN0GxS\nBgAAKGsIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjSDYAQAAaIRmnzxh\ns9muX7/u6ipKEEVRzGaziCQlJVksFleXA4e4ubkZjUabzZaQkODqWkoWX19fV5dQlOjH8uDh\n4aHT6VJTU1NSUlxdC4qYu7u7Xq9PS0tLTk52dS0lVB59nZaDHQ/VyExRFIMhfXWzZEo7nU5n\nMBisViurMjPtLQ2bzZaamurqKkooT09Pg8GQmprKItIes9lsMBjS0tJYuYWg2WAnIn5+fq4u\noSTy8vJydQkoGjqdjj/yzNgVDQBaDnZXrlxxdQkliE6nCwgIEJHY2Fh+A5V2ZrPZbDZbrdaY\nmBhX11KyBAYGuroEAHAlLp4AAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgE\nwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4A\nAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAj\nCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGiEwdUFlGje7051\ndQlFKVlERNxF3F1cSFG6MfZVV5cAlHQa68rsLCIWEZ2It6srKXJ0a3AEe+wAAAA0gmAHAACg\nEQQ7AAAAjSDYAQAAaATBDgAAQCMIdgAAABrB7U4AoOTy9/d3fCJpjk8CxahIVnqpptPpRMRk\nMrm5ubm6lpLIarXm8S7BDgBKroSEBMcnYnR8EihGRbLSSzWz2azX69PS0pKSklxdS0lks9ny\niLwEOwAouZKTkx2fCMGudCmSlV6qubu76/V6i8XCoigEzrEDAADQCIIdAACARhDsAAAANIJg\nBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAA\noBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEE\nOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAA\nAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g\n2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEA\nAGiEwdUFAACAQgo6GOXqElAwlxvUdur02WMHAACgEQQ7AAAAjSDYAQAAaATBDgAAQCMIdgAA\nABpBsAMAANAIgh0AAIBGFPd97JYM7ec+dWHvIA/74H+7Jg568+/MIzz96cru5dxFrFuXL1i7\nbd+5G/o6DZr3f25ADbO91NzaAQAAyrriTEW2Y9s/XnXhWk+bLaPp2oFrHuUefGFQ/YyWqt5u\nInLym0mzVpx5aviIp/3Tflg0f+KLKcsWDdfl3g4AAIBiCnaXds0eP/fX6LiUrO2HrvvVa9Wq\nVf3bWm0pM1ccDnv8vZ73holIzXeUnn3fWXa+f58Qt5zbQz2LZy4AAABKsmLa2+VXv+fEqW+9\n9/b4LO0Hrif7R/hZEq//e+laxn685NhtZ5MsnTqF2gdNfm0ivIx7t/6bW3vxzAIAAEAJV0x7\n7Iw+oTV9xJLinqV9f1yq7dc5j809kmqzGTyDOj/xwuAHG6XE/yUi9cxuGaPVNRs2/BWb0iHn\ndnkyffCnn36Kikp/ap67u/tTTz3lzHlCieDpWRb31xoMBhFRFKVszn5urFarq0sAABdz5ZUH\nlpTzcXq3aoGt3l421c924/d1n7y7eJIp/POHjfEiUs5wa29ioJs+LS7Jmpxze8bgtm3bNmzY\nYH/t7+8/aNAgBytMdvDzcD4PDw9Xl+AyiqKU5dnPzmKxuLoEAHAxVwY7vTF05cqVN4dMbXuN\nO7ph75aPDj4y0kNErqZZvfR6+3vRqRa9n1FnzLk9Y4IhISF169a1v/by8kpLSyumOYHrlM21\nrNPpdDqdlNXZz43VatXf7BwAoGwqWfcKiajgsSnmsptnQ5FtUYlplU3pffSxxDTfNn65tWd8\nfNiwYcOGDbO/tlqtMTExDtbj7eDn4XzXrl1zdQkuYDabzWaz1Wotm7Ofh8DAQFeXAACu5Mpb\nhVw7Ov+ZgcP/Tck4Lcb6y4UEv3q13P3uDjHqf/z1kr01Nf7AHzdSmt5bMbd2V9QOAABQ4rgy\n2PnU6FUu4b/xkxftPhh1LPLA8tnjtsV7PzuwlijGMY/WOb5k8qa9URdPHvzk1Rnm4I59K3nl\n2g4AAADXHorVGQKnzZ/y6cJlc6ZPStJ71whvMG7W5AgvNxGp2Wv6sOTZy2e9Gp2khDVuP33q\nIHsCza0dAAAAii3TcyC0pGjOsXt3apEUA+e5MfZVV5fgAhnn2Dn+R64xGjvHrqhWMV1Z6VKg\nbi3oYJTzKoEzXG5Q2/GJ5NHXscMLAABAI0rWVbEAUKrZ0q6uWrxo/c4/o5N0wZXDu/UZ0jki\n+wVe1q3LF6zdtu/cDX2dBs37PzeghpmuGEDRYI8dABSZn94Ys+yX/7oNeP7taePvCUteMHn4\nd+fisoxz8ptJs1bsatFj0Gsj+3qd2DzxxUU8MQNAUeFnIgAUDUvyuYV7r7R/470H6/uLSHid\nhhf/6PXdgoPd32xxayRbyswVh8Mef6/nvWEiUvMdpWffd5ad798nlKfDASgCBDsAKBqWpNNV\nq1e/v4bPzQYlwte069pte+ySY7edTbIM7RRqHzT5tYnwmr136799ngyzt8TExCQmJmaMbzab\ni6FylCg8QEXbHF+/eV/2SrADgKJh9G07e3bbjMHUuCOfXIirOuC2K+BS4v8SkXpmt4yWumbD\nhr9i5cn0wZkzZ2Z+5vXGjRsdL4zHXpcu/v7+ri4BTuT4+s37udgEOwAoemf2rJvz/iepNbpM\nvK9S5nZrcryIlDPcOr850E2fFpdU3PUB0CiCHQAUpZSrUZ/MnbN+f0z7R4e+/sQ97oqS+V2d\n0UNErqZZvW4ejolOtej9jBkjDBgwoFu3bukj63SxsbGOl+Tu+CRQjIpkpaPEKpL16+vrm9tb\nBDsAKDI3zmwePWaevmGXdxb3rR2YQ6By82wosi0qMa2yKT3YHUtM823jlzFCWFhYWFj6+XZF\ndYNigl3pkpqa6uoS4ETOXr/c7gQAiobNmvD6+AWmjs8vePXZHFOdiLj73R1i1P/46yX7YGr8\ngT9upDS9N/u97gCgMNhjBwBFI+HSskMJqQMamvfu2ZPRaPCo2aS+38mvl9NMFTQAACAASURB\nVP6S4Dug74OiGMc8WmfsksmbgsfV909dM3+GObhj30peLiwbgJYQ7ACgaNw4flpEPn379cyN\nPpVfXjq/xfkt67+PqTSg74MiUrPX9GHJs5fPejU6SQlr3H761EEcOgFQVAh2AFA0KrZ5fU2b\nnN9qu2DZrfugKPpO/UZ36ldMVQEoU/ihCAAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAa\nQbADAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbAD\nAADQCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQ\nCIIdAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIId\nAACARhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACA\nRhDsAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDs\nAAAANIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAA\nNIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJg\nBwAAoBEEOwAAAI0wuLoAAECuDAZ66TKHla5tjq9fm82W1/QdnDoAwHn8/Pwcn0iy45NAMSqS\nlY4Sy/H1a7FY8niXYAcAJdeVK1ccn4i345NAMSqSlY4Sq0jWb2BgYG5vcY4dAACARhDsAAAA\nNIJgBwAAoBEEOwAAAI0g2AEAAGgEwQ4AAEAjCHYAAAAaQbADAADQCIIdAACARhDsAAAANIJg\nBwAAoBEEOwAAAI0wuLoAJ/L19XVwCtYiqQPO5PhaLo10Op2IKIpSNmc/N1YrmyyAsk7LwS45\nOdnBKbgVSR1wJsfXcmlkNBr1er2U1dnPjc1mM5lMrq4CAFxJy8EuKSnJwSkQ7Eo+x9dyaaTT\n6YxGo81mK5uznwdvb29XlwAArsQ5dgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7\nAAAAjSDYAQAAaATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAA\njSDYAQAAaATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjSDY\nAQAAaATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjSDYAQAA\naATBDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjSDYAQAAaATB\nDgAAQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjSDYAQAAaATBDgAA\nQCMIdgAAABpBsAMAANAIgh0AAIBGEOwAAAA0wuDqAgBAg5YM7ec+dWHvII/sb/23a+KgN//O\n3PL0pyu7l3MvrtIAaBnBDgCKlu3Y9o9XXbjW02bL8e1rB655lHvwhUH1M1qqersVV20ANI5g\nBwBF5tKu2ePn/hodl5LXOIeu+9Vr1apV/TzGAYDC4Rw7ACgyfvV7Tpz61ntvj89jnAPXk/0j\n/CyJ1/+9dC3nfXoAUFjssQOAImP0Ca3pI5aUvE6Y2x+Xavt1zmNzj6TabAbPoM5PvDD4wUYZ\n7+7evfvcuXPpUzMaO3To4NSCUQK5u3PCpZY5vn5tuZzmYUewA4DiY0k5H6d3qxbY6u1lU/1s\nN35f98m7iyeZwj/vX8fPPsLq1as3bNhgf+3v79+1a1fHvzTZ8UmgGHl5ebm6BDiR4+vXYrHk\n8S7BDgCKj94YunLlyptDpra9xh3dsHfLRwf7v9fG3uTh4eHj42N/7e3tnfdPc2gSK13bHF+/\n7LEDgJIrooLHppjLGYMTJ06cOHGi/bXVao2Ojnb8K7wdnwSKUZGsdJRYRbJ+AwMDc3uLiycA\noPhcOzr/mYHD/02x3myw/nIhwa9eLVfWBEBDCHYA4HQnv1766edrRcSnRq9yCf+Nn7xo98Go\nY5EHls8ety3e+9mBBDsARYNgBwBOd37L+u/X/SoiOkPgtPlTWnqfmzN90stvzNl/LWTcrPcj\nvLhBMYCiwTl2AFDE9MZKa9asydzSdsGytjdfm/zrD3npjSHFXxaAMoA9dgAAABpBsAMAANAI\ngh0AAIBGEOwAAAA0gmAHAACgEQQ7AAAAjeB2JwBwm8SLR3bsPRQdn5r9rV69ehV/PQCgHsEO\nAG45/c3YOx6fGZNqzfFdgh2AEo5gBwC3PDd4/nV95dfmvXl3vSoGxdXVAEABEewA4JYt15Ib\nT1k9+dnGri4EAAqDiycA4JbWPkb38u6urgIAColgBwC3zJp6756xT++5lOjqQgCgMDgUCwC3\n1B/x3aB5QS2r1OzYpUPlQHOWdxcvXuySqgBAJYIdANzy64S286KuilzdvP7b7BdPEOwAlHAc\nigWAW4bN2+NV+dFdp6NTkxKzc3V1AJAP9tgBQDqbNf5gQlrbRW+2qBrg6loAoDDYYwcA6RTF\nUNWkv3rgsqsLAYBCItgBwE2K6fu5fY68/8DstQdtrq4FAAqBQ7EAcMuQz46FGm682K3hBL8K\nQV5uWd49d+6cS6oCAJUIdgBwS2BgYGDnrk1cXQYAFA7BDgBuWbVqlatLAIDC4xw7AGXdPykW\nNaMlx/zp7EoAwEEFCHZX9n436JFO/b87Yx/c1Dmi5QN9Vv7B5WMASreIFoPOJOeT7XZ/Ob1B\nlWbFUw8AFJraYBd77MNaLR75ZO1eN/f0jwQ0DT+zZfnjrcM/OHzVaeUBgNNFH1jStNmAE0k5\nZ7vUG1Ev9Yxo/sQrZ6RqMRcGAAWlNth9/PDL8R4R286eX3xfZXtL0zdXnjy78y5z0is9P3Ra\neQDgdDvmDog9uLRZ06eiEtKyvHVw9cymVRq/9fWBug+O3HPuoEvKAwD11Aa7Wcdja/ad17qi\nR+ZG96Bmc4bUvnbsfScUBgDFpOXwj3d/PDwuasVdEY8fik+1N1qSzkzr16Zh99FHkitO+nT7\noTWzGvmbXFsnAORL7VWxFpvN6GvM3q4360WsRVoSABS3iAFzD7i73/HUjJaNev7651fmXR/3\nfnLUnsuJNf83dPnSmXcEubu6QABQRe0euxHVfKIWTTp3+/nF1pSLk+cd8a402AmFAUCxqvf4\nuwe/ecV6Zm3zGvVqdR62/7r/2EWbjv64gFQHoBRRu8duyDevvN5kTP0694weNaB1o5pmXeqp\nQ79/NvOtTdFpk9eNcGqJAFA8wrpPifzBo0nXiSk6r5VHjvSo5u3qigCgYNQGu4AGL0au1fcc\nPHHy89syGt0D6kz58qtXmgU5pzYAKG5VOk+I3OQR8b/RQ3uPvWvb/FCj3tUVAUABFODJE9W6\nPL/7zJCDv/2y/8iZBIshuEb9Du3v9NErBfq+JUP7uU9d2Dso4yIM69blC9Zu23fuhr5Og+b9\nnxtQw2woVDsAFNKOHTtuGzbc+cGbT/Qc82GTlqnfzHk6c7Jr3bp18ZYGAAVTsFQUtWXV1z/u\nOnsppt3bC//ntvP3w5fbNyiv+tO2Y9s/XnXhWk+bLaPp5DeTZq0489TwEU/7p/2waP7EF1OW\nLRquK3g7ABRamzZtcmy/su+T9m0+ydxiy9R9AUAJpD7Y2RYMaDN8yU77gPmVOQ/Ezbk74vt2\nA+duWjTckN9uu0u7Zo+f+2t0XMrtk0yZueJw2OPv9bw3TERqvqP07PvOsvP9+4S4Faw91LMg\nswwAt5k0aZKrSwCAoqE22J1Y1mP4kp0dh8+eObJn4/BQEfEPf+eNZ6NfWjSiW0THdUPr5P1x\nv/o9J07tak39b8z4tzMak2O3nU2yDO0Uah80+bWJ8Jq9d+u/jz1wqkDtfZ4Ms7fExMQkJiZm\nTN9sNqucO5Reen1ZPAVKUdJ/S5XN2c9NoXenTZs2rWgrAQBXURvspo/eGFB3wqZ5L9z6pLnO\nhIU7UnYGvj15mgxdlvfHjT6hNX3EknLbXQNS4v8SkXpmt4yWumbDhr9iUzoUrF2eTB+cOXPm\nhg0b7K/9/f03btyocu5yk+zg5+F8/v7+ri7BZXQ6XVme/ewslnye9woAmqf2/LSvrySG9X8i\ne/vDfWskRa8t3Hdbk+NFpJzhVg2Bbvq0uKSCthfu2wEAADRG7R67Kib9jWPXs7dfjYzVm0IK\n9906o4eIXE2zet08nBSdatH7GQvanjHBYcOGPflk+u47RVGuXbtWuMIyeOQ/ClzM8bVcGrm7\nu7u7u1ut1uvXc9gqyyybzcYuTABlnNpg9/Jd5fsv7fvbm5EtAm8dTk24sGXAipOBTT8s3He7\neTYU2RaVmFbZlB7UjiWm+bbxK2h7xgRDQkJCQtJTptVqjYmJKVxhKEXS0rI+tb0ssFrTn+NX\nNmcfAJAbtYdie6z4sIpytn31JoPHTBWRyOWfTBvbv15457PW4LlfPVa473b3uzvEqP/x10v2\nwdT4A3/cSGl6b8WCthfu2wEAADRG7R47j6D79/+5Zsjg0R/NnCwiWyeN/kXR17/7sVXzFnQN\nLuzdRhTjmEfrjF0yeVPwuPr+qWvmzzAHd+xbyUtECtoOAEUo5p+Tl+NTs7fXrl27+IsBAPUK\ncINin/AuX2zp8vHlU5EnLqTpPSqF16/kZ3Lw62v2mj4sefbyWa9GJylhjdtPnzpIV6h2ACgS\nSVc2PdKm17qonE/k4AbFAEq4Aj15wnrx5IngGuF3BlVPurT7zddHXTVWfvCZ4Z1qqH1Ott5Y\nac2aNbc1KfpO/UZ36pdt1IK2A0BR+PChPuuP3eg6dMJ9jarle+t1AChp1Aa7lNhdT7TtuuZE\nxZT4SFva1Yfqtf8pOlFEPpi5aEnU309W4XgoAC2YvvtyjV7frl3QzdWFAEBhqD2Subx7z1WH\nUvqNek5ELu0d+VN04vB1R6+e2t7U7cKYXiudWSEAFBOb5cblVEvVXo1cXQgAFJLaYPfGH5eq\ndluxeNoQEflr+jaTb9v3u4T7VWvz/lM1o/+e6cwKAaCYKHqvDn7uJ5fscXUhAFBIaoPd2eS0\nwJaV7a8/++NyuUaj7LeS86zhmZZ4wjm1AUAxU5Z/Py1l/VP9p332Xzz3CARQ+qgNdq19TOd/\nOCAiydc2fnk5oelLTe3te1b/42au46zqAKB4PTphdYVgt89e7R/s7R4YUqny7VxdHQDkQ+3F\nE1P612oze8CDA/cafv8/xRDwRrvgtKTji2fMeGHHvxXumeHUEgGg2AQGBgYG3lu1iavrAIBC\nURvsWryzZfL5+974dE6q4jFg5q8NPd3izq8eNmmhV6W2S7/q4dQSAaDYrFq1ytUlAEDhqQ12\nOkO5V1fsfjnhSrw+wNekExF3/y7frW/ZoVNLXz33egIAAHC9At2gWAzmQN9br+s9dF+R1wMA\nxS0iIkLRmfbt/c3+Oo8x9+/fX1xFAUBhFCzYAYD2eHl5Kbr0ByT6+fm5thgAcATBDkBZt337\n9ozXP//8swsrAQAHqb3dCQAAAEo4gh0AAIBGFOxQbMw/Jy/Hp2Zvr127dhHVAwAAgEJSG+yS\nrmx6pE2vdVExOb5rs9mKriQAAAAUhtpg9+FDfdYfu9F16IT7GlUzcN86AACAkkdtsJu++3KN\nXt+uXdDNqdUAQEkQtXnFlz/uOnsppt3bC3u77fz9QqP2Dcq7uigAyJ+qYGez3LicamnYq5Gz\nqwEAV7MtGNBm+JKd9gHzK3MeiJtzd8T37QbO3bRoOMcrAJRwqq6KVfReHfzcTy7Z4+xqAMC1\nTizrMXzJzo7DZ/957Ly9xT/8nTeebfnL4hHdFh5xbW0AkC+VtztRln8/LWX9U/2nffZffJpz\nKwIA15k+emNA3Qmb5r3QqGaIvcVgrjNh4Y4pDcv9Mnmaa2sDgHypvY/doxNWVwh2++zV/sHe\n7oEhlSrfzqklAkCx+fpKYlj/J7K3P9y3RlL02uKvBwAKRO3FE4GBgYGB91Zt4tRiAMDFqpj0\nN45dz95+NTJWbwop/noAoEDUBrtVq1Y5tQ4AKAlevqt8/6V9f3szskWge0ZjwoUtA1acDGz6\noQsLAwA1eKQYANzSY8WHVZSz7as3GTxmqohELv9k2tj+9cI7n7UGz/3qMVdXBwD5yGuPXURE\nhKIz7dv7m/11HmPu37+/iOsCAFfwCLp//59rhgwe/dHMySKyddLoXxR9/bsfWzVvQddgT1dX\nBwD5yCvYeXl5KTqT/bWfn1+x1AMALuYT3uWLLV0+vnwq8sSFNL1HpfD6lfxMrirGw8PDVV8N\nV2Gla5vj6zfv57jmFey2b9+e8frnn392sA4AKBWu7P3upTfmp/b5aEn31iKyqXNET0ODF1+b\n+VjzoOIvxmg0Oj4Rq+OTQDEqkpWOEsvx9Wu15rVNq714AgDKgthjH9ZqMTRW8X16UPopyAFN\nw8/MXv74T2uj/zo1tK5/cdcTG+v4RLwdnwSKUZGsdJRYRbJ+TaZcDyNw8QQA3PLxwy/He0Rs\nO3t+8X3pd+hs+ubKk2d33mVOeqUnV8UCKOkIdgBwy6zjsTX7zmtd8baTYNyDms0ZUvvasfdd\nVRUAqESwA4BbLDab0TeHM2D0Zj3nqgEo+Qh2AHDLiGo+UYsmnUu2ZG60plycPO+Id6XBrqoK\nAFQq2MUTUZtXfPnjrrOXYtq9vbC3287fLzRq36C8kyoDgOI35JtXXm8ypn6de0aPGtC6UU2z\nLvXUod8/m/nWpui0yetGuLo6AMiH+mBnWzCgzfAlO+0D5lfmPBA35+6I79sNnLtp0XCD4qTy\nAKBYBTR4MXKtvufgiZOf35bR6B5QZ8qXX73SzAW3OwGAAlEb7E4s6zF8yc6Ow2fPHNmzcXio\niPiHv/PGs9EvLRrRLaLjuqF1nFkkABSfal2e331myMHfftl/5EyCxRBco36H9nf66Pn9CqAU\nUBvspo/eGFB3wqZ5L9z6pLnOhIU7UnYGvj15mgxd5pzyAMAFYs7/4xZQpXmrKvbBi8ePXhQR\nkdq1a7uwKgDIl9pg9/WVxLqjnsje/nDfGlMmrC3SkgDAZZKubHqkTa91UTE5vpv3k3wAwOXU\nBrsqJv2NY9ezt1+NjNWbQoq0JABwmQ8f6rP+2I2uQyfc16gaZw8DKHXUBruX7yrff2nf396M\nbBHontGYcGHLgBUnA5tyN3YAGjF99+Uavb5du6CbqwsBgMJQex+7His+rKKcbV+9yeAxU0Uk\ncvkn08b2rxfe+aw1eO5XjzmzQgAoJjbLjcuplqq9Grm6EAAoJLXBziPo/v1/rnmkme6jmZNF\nZOuk0a/NWOrdoueq/X89EuzpxAIBoLgoeq8Ofu4nl+xxdSEAUEgFuEGxT3iXL7Z0+fjyqcgT\nF9L0HpXC61fyMzmvMgAodsry76c17fhU/2nxb496soJnwW7hDgAuV+BuyyOo+p1B1Z1RCgC4\n3KMTVlcIdvvs1f6fv/ZMQMWKHrffvu7cuXOuKgwA1ChAsEu8eGTH3kPR8anZ3+rVq1fRlQQA\nLhMYGBgYeG/VJq6uAwAKRW2wO/3N2DsenxmTas3xXYIdAG1YtWpVju02a8KN+GKuBQAKTG2w\ne27w/Ov6yq/Ne/PuelW4txOAsuafTQ/X6HYkNemMqwsBgLyoDXZbriU3nrJ68rONnVoNALiW\nzRI3b+SgzzbviU5My9z+79kzikc9V1UFACqpvd1Jax+je3n3/McDgNJs/9QOz89bft2veq3g\ntNOnT9dp1KRxozqG6AtKwN0LVm9wdXUAkA+1wW7W1Hv3jH16z6VEp1YDAK718tzIcg2mH935\n04bth6u5G9rM+/y71ev/Ov5TcMJvcSHcsxNASaf2UGz9Ed8NmhfUskrNjl06VA40Z3l38eLF\nRV0YALjA9uspdUd3FRFF79WnvHnLvuiJlb09yrf/vH+1hx5dPDJynKsLBIC8qA12v05oOy/q\nqsjVzeu/zX7xBMEOgDb4G5TUG+k3dbqrkufK1efloWoiUrVHpWsfzRIh2AEo0dQeih02b49X\n5Ud3nY5OTUrMzqklAkCxGRjqffzTt84lW0SkcrfQf9Z9aG//d/N/Lq0LAFRRFexs1viDCWlN\n33yzRdUAZxcEAC40+JNBiZe/DQuscirJEtZ3YMKl/2s5YNy7U1/sOuNgQP3xrq4OAPKh6lCs\nohiqmvRXD1yWJ2s6uyAAcKHg9u/s/yZ4yqK1OkU8gwd/OfLrJ2e/95vN5hPW+esNg11dHQDk\nQ92hWMX0/dw+R95/YPbagzYnFwQArtX44Re/3bClqkkvIr1mbow5c+TA4TNXjm3oVN7D1aUB\nQD7UnmM35LNjoYYbL3Zr6OFfsXI2Ti0RAIpNy5Yt3/snLnOLT+VajetUid71fNt7+riqKgBQ\nSe1VsYGBgYGdu/JcbACadP3U8YspFhH57bffahw+HBXvc/v7toM/bNu5/bQrSgOAAlAb7HJ7\nMDYAaMA399319NEY++sv/tf8i5zG8ak2vDhLAoBCUBvsAEDDWk2dufBakogMGTKk/bRZjwdl\nPZ1O5+bd8pFHXVEaABRAXsEuIiJC0Zn27f3N/jqPMffv31/EdQFAMardq19tERFZvnx596cH\nDg7xcnFBAFAoeQU7Ly8vRWeyv/bz8yuWegDAlX7++WcR68WTx4JrhItI0qXdb7675Kqx8oPP\nDO9Uw9vV1QFAPvIKdtu3b894/fPPPzu/GABwsZTYXU+07brmRMWU+Ehb2tWH6rX/KTpRRD6Y\nuWhJ1N9PVmFPHoASTe3tTrLfAsDu353cAgCAdizv3nPVoZR+o54TkUt7R/4UnTh83dGrp7Y3\ndbswptdKV1cHAPnI5+IJbgEAoEx5449LVbt9t3ja/SLy1/RtJt+273cJ10v4+0/VbPf5TJGn\nXV0gAOQln2DHLQAAlClnk9MatEy/6fpnf1wu12iWXkREPGt4piX+7cLCAECNfIIdtwAAUKa0\n9jEd+uGAjG2YfG3jl5cT7l/S1N6+Z/U/buY6rq0NAPKVT7DjFgAAypQp/Wu1mT3gwYF7Db//\nn2IIeKNdcFrS8cUzZryw498K98xwdXUAkA+1NyjmqlgAZUGLd7ZMPn/fG5/OSVU8Bsz8taGn\nW9z51cMmLfSq1HbpVz1cXR0A5IMnTwDALTpDuVdX7H454Uq8PsDXpBMRd/8u361v2aFTS1+9\n4urqACAfBDsAyMpgDvS99breQ/e5shgAUI9gB6Cs4/GJADSDYAegrOPxiQA0o2DBLmrzii9/\n3HX2Uky7txf2dtv5+4VG7RuUd1JlAFA8eHwiAM1QH+xsCwa0Gb5kp33A/MqcB+Lm3B3xfbuB\nczctGm7glGIApdbq1atVjvnQQw85tRIAcJDaYHdiWY/hS3Z2HD575siejcNDRcQ//J03no1+\nadGIbhEd1w3lvp0ASqvu3burHNNmszm1EgBwkNpgN330xoC6EzbNe+HWJ811JizckbIz8O3J\n02ToMueUBwBOt3Xr1ozX1tRLrzzZf3diyNPPPXtPiwZ++qRjkbsWvjP3YuVHt66b6boaAUAV\ntcHu6yuJdUc9kb394b41pkxYW6QlAUCxat++fcbrn4c02J0Qvu3M73cFpF9O0en+h58dPqBD\ncMSjE/sc/vh/LqoRAFTRqRyvikl/49j17O1XI2P1ppAiLQkAXGbcF8fCnvogI9XZGcx1Zw2s\ndWLFGFdVBQAqqQ12L99V/vjSvr9dScrcmHBhy4AVJwMjxjuhMABwgeOJaTpjTh2jTizJ/xR7\nOQBQMGqDXY8VH1ZRzrav3mTwmKkiErn8k2lj+9cL73zWGjz3q8ecWSEAFJ/HgszHPx9/OtmS\nudGSfPblj4+Zy/d2VVUAoJLaYOcRdP/+P9c80kz30czJIrJ10ujXZiz1btFz1f6/Hgn2dGKB\nAFCMJi58IvnaL40bdJn9f6t+23/48IHfVy+bc3/DRpuuJj3+wQRXVwcA+SjADYp9wrt8saXL\nx5dPRZ64kKb3qBRev5KfKf+PAUDpUaXboi2zDY+NW/Ri340ZjXpj0LDZm+d3q+LCwgBADbXB\nLj4+Pv2VuXzdhvanTaTFx6cZ3EwmI88lA6Add78w/8LTY3/8fuPBExdSde6hNRvee///qnjR\n0QEoBdR2VV5eXrm9pTOYQ6uH3dW+8+DRE++tw2MWAZR6bt7Vuj4+qKurywCAglJ7jt3CD+Y0\n9TUpOmPEPQ8+O/z5F0YMfbjTnSadEti054ghfVvUDfp16ezODasvPh7r1HIBAACQG7V77JpF\nfzUiueKX+/b0ahyY0Rjz99fNWvTzeuPoys6hKdejnqp358THlg3aN8w5pQIAACAvavfYjXz3\nj7Anl2ZOdSIS0PDRpf2qzu4zSkSMPrXfmd/82pH3i75GAAAAqKB2j11kQmrVyjnc1sSzimfS\n1Z/srz1CPS0pF4qsNKBIBR2McnUJyMvlBrVdXQIAlHpq99g9E+oVNX/Kudtv2mlNuTB19mGv\nkP72wfXT/3YPuL9o6wOA4he1ecXkcSOf7t93yX8JSTGbfjl4ydUVAYAqavfYjV/12gd3jq0X\n3nbokN531qlqkuQzUftWLpq/K1o/Y/ek5NifezwwcN2O0w8uXO/UcgHAyWwLBrQZvmSnfcD8\nypwH4ubcHfF9u4FzNy0ablBcWxsA5ENtsCvXZFTUzwEDRrz87sQXMhr9wtsu2rJ8YJNy8RcP\nbT9hHPLWtx8MruOcOgGgOJxY1mP4kp0dh8+eObJn4/BQEfEPf+eNZ6NfWjSiW0THdUPp4gCU\naAW45WZI2/4//tn/4rH9B46cSbAYKlave1ejML0t4fqNBJ/gYdcv46IvswAAIABJREFUDnde\nlQBQPKaP3hhQd8Kmebd+wRrMdSYs3JGyM/DtydNk6DIX1gYA+SrwvdSDwyOCwyMyBs9tfLhG\ntyOpSWeKtCoAcI2vryTWHfVE9vaH+9aYMmFt8dcDAAWiNtjZLHHzRg76bPOe6MS0zO3/nj2j\neNRzQmFFwGTiUbbax1rWDMdXpc1mc7yMKib9jWPXs7dfjYzVm0Icnz4AOJXaYLd/aofn5+0N\nb9mplt/hn3b9c1+37iZJivx5ixJw94Llnzm1xEIzm80OTiEt/1HgYo6vZZQQjq9Kq9XqeBkv\n31W+/9K+v70Z2SLQPaMx4cKWAStOBjb90PHpA4BTqQ12L8+NLNdg+tGdE22WuBpe/m3mfT6x\nsnfipV8aVL8/LiSH+9uVBFevXnVwCt5FUgecyfG1jBKiSFZlYGBg/iPlqceKD1+t+lD76k36\nD35CRCKXfzLt2l8fL1h23hq8/KvH1E9nydB+7lMX9g7yyOlN69blC9Zu23fuhr5Og+b9nxtQ\nw1zgs2IAIEdq72O3/XpKtd5dRUTRe/Upb96yL1pEPMq3/7x/temPLnZigQBQjDyC7t//55pH\nmuk+mjlZRLZOGv3ajKXeLXqu2v/XI8Eqf8Tajm3/aNWFa2m5HBo++c2kWSt2tegx6LWRfb1O\nbJ744qIi2NMIACKifo+dv0FJvZFqf31XJc+Vq8/LQ9VEpGqPStc+miUyzkn1AUAx8wnv8sWW\nLh9fPhV54kKa3qNSeP1KfmrP/7u0a/b4ub9Gx6XkOoYtZeaKw2GPv9fz3jARqfmO0rPvO8vO\n9+8TWkIPfQAoXdTusRsY6n3807fsT56o3C30n3Xp55r8u/k/Z5UGAMUu/iaruXzdhk0a1qvt\n75YWHx+fnKLqnFu/+j0nTn3rvbfH5zZCcuy2s0mWTp1C7YMmvzYRXsa9W/8tmuoBlHlq99gN\n/mTQ1LvfCwusEnX5bFjfgQkvDW05oEKP6qkzZhwMqP+eU0sEgGLj5eWV21s6gzm0ethd7TsP\nHj3x3jp+OY5j9Amt6SOWFPcc3xWRlPi/RKSe2S2jpa7ZsOGvWHkyfXD58uUHDhywvzabzePH\n55oRoVXe3pzgrWWOr9+87wCgNtgFt39n/zfBUxat1SniGTz4y5FfPzn7vd9sNp+wzl9vGOxg\niQBQQiz8YM6HE8buv2Fr0qFzs7rVPZTUs1G7123e693k0Sdalbt49uj2pbO/XfLRwsOnB9X0\nLcT0rcnxIlLOcOtoSaCbPi0uKWPw4MGDmzZtsr/29/d/9dVXHZshEZFkxyeBYsRdnLTN8fVr\nsVjyeFdlsLMmJ6fW6/7itw+/aB/uNXNjlxePnop3r1e7ihsPTwSgFc2ivxqRXPHLfXt6Nb51\ngW3M3183a9HP642jKzuHplyPeqrenRMfWzZo37BCTF9n9BCRq2lWL73e3hKdatH7GTNGaNCg\nQVpa+mFfs9mcnEwqK3NY6drm+Pq12Wz6mx1IdqqCnc1yw8/sf9cXx7b2Csto9Klcq7GDpQFA\nCTPy3T/CntyUOdWJSEDDR5f2e/XePqNev7TC6FP7nfnNaz3+vkhhgp2bZ0ORbVGJaZVN6f3y\nscQ03za3Duz27t27d+/e9tdWqzUmJqaws3ILB/ZKlxs3bri6BDhRkaxfd/dcz/dQdfGEovcd\nXTfg5Ce7HS8FAEqyyIRUc+UcLlD1rOKZdPUn+2uPUE9LyoXCTd/d7+4Qo/7HXy/ZB1PjD/xx\nI6XpvRULNzUAyELtVbGvbF/X6Nxzw+esjk7O68guAJRqz4R6Rc2fcu72js6acmHq7MNeIf3t\ng+un/+0ecH+BJnvy66Wffr5WREQxjnm0zvElkzftjbp48uAnr84wB3fsWynXKzYAoEDUXjzR\n9bGJ1gpVPhj58AcvulcIDnJ3uy0Rnjp1ygm1AUBxG7/qtQ/uHFsvvO3QIb3vrFPVJMlnovat\nXDR/V7R+xu5JybE/93hg4Lodpx9cuL5Akz2/Zf33MZUG9H1QRGr2mj4sefbyWa9GJylhjdtP\nnzpI7S9sAMiP2mDn7u4uEvLAAzwDG4CWlWsyKurngAEjXn534gsZjX7hbRdtWT6wSbn4i4e2\nnzAOeevbDwbXyWMiemOlNWvWZG5pu2BZ24wBRd+p3+hO/Yq8dgBQHezWrl3r1DoAoIQIadv/\nxz/7Xzy2/8CRMwkWQ8Xqde9qFKa3JVy/keATPOz6xeGuLhAAclWwJ09HbV7x5Y+7/r+9Ow+I\nov7/OP7ZXRbYBWQ5vMELMfFGs0Mts/SrlpFHKWpe5ZX3UVh5C1/LTC2vNEvNI/FALbX0p5Xx\nNb9qeWSamleZt3Io98Lu/P5YQ74msLa7DHx4Pv6a+czsZ9848e7F7MzsheuJT85YFKnfu/9y\ng5b1yrmoMgBQUcXQ8Iqh4bmrf+7sVCPiZHbmHyqWBACFsj/YKQv7tRi6fK9txThx7nOpc1uF\nb32y/7xdi4e68Sg7AFJQLKnzRw347JufEjL+5zvErl74Q2Ooo1ZVAGAne6/ZPbu689Dle58Z\n+sHPpy/ZRvxC35s+8PHvlwyLWHTSZeUBQJE6PO2pEfNjb5uq16qY8/vvv9du0Khhg9puCZc1\n/q0WfrFd7eoAoBD2nrGLGbvTP+zNXfPvXk3sZqz95qIfzHsDZ0yJFq+tdk15AFCk3p53PKBe\nzG97xyuW1Brefi3mrxgf7JNx/ft61Z9NrXSf59sBQLFi7xm7DTczQvr2+Pt4p941MhO4rwKA\nJP5z21wtsoMQQqPz7lXO+O2hBCGEoVzLFX2rxby4RO3qAKAQ9ga7Kh66lNO3/z6edPyWzoNn\noACQhJ+bJjsl27b8aJDXpS/uXHxStXNQ8pk56tUFAHaxN9i9/Wi5M6t677uZmXcw/fK3/dae\nCwwf54LCAEAF/Sv7nFn2ru2bJ4IjKl/86mPb+NVvrqlaFwDYxd5g13ntx1U0F1pWbzTo9WlC\niOOxS6Pf6FsntO0Fa8V567u6skIAKDqDlg7IuLExJLDK+UxLSO/+6ddXPt4vaua00R1mHfOv\nyx+xAIo7e2+eMJR99vDPXw4eNPaT2VOEELsnjP1eo6vbquum+Qs7VOSCYgCSqNjyvcNxFacu\n3qLVCK+Kg9aM2tDzg/f3KUqZkLYbtg9SuzoAKIS9wS7FopQJbf/5t+0/vXH++NnLOTpDUGjd\nIJOHS4sDgKJlzcrKrtNx9MZOo23r3WbvbD/6t/NpnnUeqqLngZ0Aij17P4otG1iz58joXUcu\nGspWf/ix5o81bUyqAyAZxZJiMhrarDubd7BMcK2GtUl1AEoGe4Ndy5pizbzJbcKDgxq1nvTh\n6rNJZpeWBQBFT6PzHRvmf27pj2oXAgD/kL3BbsePZxNO718YM7am9WT0qJdrlQ1o2WXQ8q37\nMqwuLQ8AitTE/3zV4M/hQ+d+kZBlUbsWAHhg9gY7IYRfSNPXxr+/++jFK8f3zHq7r/nYpn7P\nPx5QMeyVN2a4rj4AKEoduo7PKF/lo1Gdyhp9KgZVrf6/1K4OAAph780TeVWo03zUtOZDRo9Z\nMHHIGwt3LHv/zaUzeQoAABl4enoKUem553juOoAS6YGDXca1U19ujIuLi9vy3eFMq+JbLbxb\nt0hXVAYARW/LFr4jEUAJZvfjTi7+sikuLi4u7us9x7MVxVA+7MVhk7t3797+sVrcKwZAMqe+\nWbtmx38vXE98csaiSP3e/ZcbtKxXTu2iAKBw9gY7U5WGVkVx960W0T+qe2RkRKtG3PwPQEbK\nwn4thi7fa1sxTpz7XOrcVuFbn+w/b9fioW70PQDFm703T7TrOXzF1r2Jiec2fPxul6dJdQDk\ndHZ156HL9z4z9IOfT1+yjfiFvjd94OPfLxkWseikurUBQKHsPWO3beWH+W1Ku/SLV+X6TqoH\nANQUM3anf9ibu+aPzB1xM9Z+c9EP5r2BM6ZEi9dWq1gbABTqAR53co/Mm6djF8Z0fLKeb3BD\nJxYEACracDMjpG+Pv4936l0jM4H7KgAUdw98V2z27QvbNqyLjY3d/M2hLKsihCj70OMuKAwA\nVFDFQ5dy+vbfx5OO39J58AwUAMWdvWfsLJnXtn8+v29EiwD/6p1efWPtzoNuFer0HfPv//vp\n/PWTe11aIgAUmbcfLXdmVe99NzPzDqZf/rbf2nOB4TywE0BxV8gZO2tOcvyXG2JjYzds3p2Q\nbRFCGMs/1Lpa4q79N5IvHuMGMQCS6bz240lVX2hZvVHfQT2EEMdjl0YnH/104epL1oqx67uq\nXR0AFKKgYDeyV4f1G3dcSc8RQpiqNerXqXPnLl3aNatz5uPmYftvkOoAyMdQ9tnDP385eNDY\nT2ZPEULsnjD2e42ubquum+Yv7FDRS+3qAKAQBQW7uau2CSEe7TF++thXn27MlyQCkF+KRSkT\n2v7zb9t/euP88bOXc3SGoNC6QSYPtesCALsUdI1dkLdeCHFgzfTBrw2ZNOezY5fTiqoqAFBH\n2cCaPUdG7zpy0VC2+sOPNX+saWNSHYASpKBgdyHpxu64JQO7tLp5eGf0mL4NgnzrP9kxZmHs\n6YTMAl4FACVXy5pizbzJbcKDgxq1nvTh6rNJZrUrAoAHUFCw07j5tuzcf9H6b27curj1sznd\n2zY5+8OXE4d2jxh/SAgx8YNVp26Q8ABIZcePZxNO718YM7am9WT0qJdrlQ1o2WXQ8q37Mqxq\nVwYAdrDrcSc6Q4Xneo9a/fX+pOu/rVkQHdE8TKfRxIzuFVbB79Fne89fs9PVVQJAkfELafra\n+Pd3H7145fieWW/3NR/b1O/5xwMqhr3yxgy1SwOAQjzYN094BNSMHDLhiz2/Jv1xeMmMca3q\nlz3w9crhPf7louIAQEUV6jQfNW3e9/v2zx7aznzj1LL331S7IgAoxAN/84SNT3DD/lEN+0e9\ne+3ED2s+/9y5NQGA6jKunfpyY1xcXNyW7w5nWhXfauHdukWqXRQAFOIfBrtc5cOaj4pu7pRS\nAEB1KRd/2RQXFxcX9/We49mKYigf9uKwyd27d2//WC2e3Qmg+HM02AGATExVGloVxd23WkT/\nqO6RkRGtGukJdABKDoIdANzVrufwyMjIzu0f89IS6ACUPAQ7ALhr28oP89uUdukXr8r1i7IY\nAHhQD3ZXLACUNpk3T8cujOn4ZD3f4IZq1wIAheCMHQDcR/btC9s2rIuNjd38zaEsqyKEKPvQ\n42oXBQCFINgBwF2WzGs7N66PjY3d+NV/UyxWIYRXpbrdI3v06NGjTZNqalcHAIUg2AGAsOYk\nx3+5ITY2dsPm3QnZFiGEsfxDrasl7tp/I/niMTfuowBQQhDsAJR2I3t1WL9xx5X0HCGEqVqj\nfp06d+7SpV2zOmc+bh62/wapDkAJQrADUNrNXbVNCPFoj/HTx776dOPqapcDAP8cd8UCKO2C\nvPVCiANrpg9+bcikOZ8du5ymdkUA8A8R7ACUdheSbuyOWzKwS6ubh3dGj+nbIMi3/pMdYxbG\nnk7IVLs0AHgwBDsApZ3Gzbdl5/6L1n9z49bFrZ/N6d62ydkfvpw4tHvE+ENCiIkfrDp1g4QH\noGQg2AHAHTpDhed6j1r99f6k67+tWRAd0TxMp9HEjO4VVsHv0Wd7z1+zU+0CAaAQBDsAuJdH\nQM3IIRO+2PNr0h+Hl8wY16p+2QNfrxze419q1wUAhSDYAUC+fIIb9o9695sjF67+umfOhCFq\nlwMAheBxJwBQuPJhzUdFN1e7CgAoBGfsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAAACRB\nsAMAAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJEGwAwAA\nkATBDgAAQBIEOwAAAEkQ7AAAACThpnYBAIB8+fr6Oj6J1fEpUIScctBRbDl+fK3Wgn6nCXYA\nUHyZzWbHJ6HRlyxOOegothw/voqieHh45LeV33cAKL4yMjIcn8TH8SlQhJxy0FFsOeX4ent7\n57eJa+wAAAAkQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ\n7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJEOwAAAAk4abu21/77/gB7/ySd+SVZes6BngKYd0d\nu3BL/KE/U3S16z3Sd3i/GkZbqfmNAwAAlHYqp6LkI8mGgOdHDqibO1LVRy+EOBc3Yc7aP14e\nOuwVv5xtixeMH21evXioNv9xAAAAqBzsrv9621SnWbNmdf9nVDHPXnsipPv7L7UOEULUfE/z\nUu/3Vl/q26uS/v7jlb1UKR4AAKBYUfls15HbWX7hJkvG7avXk5W/BrNuxV/ItLRpU9m26mFq\nEe7tfnD31fzG1SgcAACg2FH5jN3h1Gxlz9yu805mK4qbV9m2PUYOer6BOe2oEKKOUZ+7W5jR\nbfvRW+an7j8uet5ZXbZs2Y8//mhb9vLymj59uoPlWR18PVzP19dX7RLgHI4fSquVX1kApZ2a\nwc5ivpSq01cLbDZj9TSTkrL/q6Uzl0zwCF3RyT1NCBHgdvdsYqBel5Oaac26/3ju6tmzZw8c\nOGBb9vPz0+vvRsB/JsvB18P1HD/KKCYcP5QWi8UplQBAyaVmsNO5V163bt1fax5PdIv6bfvB\nbz851mWUQQiRlGP11uls2xKyLTqTu9b9/uO5E9arVy8nJ8e2bDQas7IIZvLjKEvD8UOpKIru\nr+YAAKVT8XpWSHh5w67EG3qv+kLEn8rICfa406NPZ+T4tjDlN5778sjIyMjISNuy1WpNTEx0\nsB4fB18P10tJSVG7BDiHUw6lp6en45MAQMml5s0Tyb8teLX/0Kvm3MtirN9fTjfVqeVpalXJ\nXbdjz3XbaHbakQMp5satK+Q3rkbtAAAAxY6awa5MjW4B6dfGTVn847FTp48fif0gKj7NZ2D/\nWkLj/vqLtc8sn7Lr4Kkr544tnTTLWPGZ3kHe+Y4DAABA3Y9itW6B0QumLlu0em7MhEydT43Q\nelFzpoR764UQNbvFDMn6IHbOpIRMTUjDljHTBtgSaH7jAAAAUPkaOw+/uoPfmj747xs0ujZ9\nxrbpY/c4AABAqccJLwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQ\nBMEOAABAEgQ7AAAASRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAAACRBsAMAAJAEwQ4A\nAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJEGwAwAAkATBDgAAQBIE\nOwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABAEgQ7AAAA\nSRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJEOwA\nAAAk4aZ2AQAgE+vu2IVb4g/9maKrXe+RvsP71TDe22av/Xf8gHd+yTvyyrJ1HQM8i7BIANIi\n2AGA05yLmzBn7R8vDx32il/OtsULxo82r1489J5PRpKPJBsCnh85oG7uSFUffRHXCUBWBDsA\ncBLFPHvtiZDu77/UOkQIUfM9zUu931t9qW+vyl5597r+621TnWbNmtXNZxYA+Oe4xg4AnCPr\nVvyFTEubNpVtqx6mFuHe7gd3X71ntyO3s/zCTZaM21evJytFXiQAuXHGDgCcw5x2VAhRx3j3\nc9Uwo9v2o7dEz//Z7XBqtrJnbtd5J7MVxc2rbNseIwc93yB364QJE7Zv325b9vPz27lzp+OF\nZTk+BYpQYGDgg+x+ylV1wDUe8Pjeh8ViKWArwQ4AnMOalSaECHC7+0lIoF6Xk5qZdx+L+VKq\nTl8tsNmM1dNMSsr+r5bOXDLBI3RF39qmoi4XgIwIdgDgHFp3gxAiKcfqrdPZRhKyLTqTe959\ndO6V161b99eaxxPdon7bfvDbT471fb+FbeiFF15o3Lixbdnd3T01NdXxwrg1o2RxykFHseX4\n8VUUxcfHJ7+tBDsAcA69V30h4k9l5AR73Al2pzNyfFsUciouvLxhV+KN3NWmTZs2bdrUtmy1\nWhMTE51QmONToAhlZmYWvhNKLKcc3wKCHTdPAIBzeJpaVXLX7dhz3baanXbkQIq5cesKefdJ\n/m3Bq/2HXjVb/xqwfn853VSnVtFWCkBaBDsAcBKN++sv1j6zfMqug6eunDu2dNIsY8Vnegd5\nCyHObVi1bMUWIUSZGt0C0q+Nm7L4x2OnTh8/EvtBVHyaz8D+BDsAzsFHsQDgNDW7xQzJ+iB2\nzqSETE1Iw5Yx0wbY/nq+9O3XWxOD+vV+XusWGL1g6rJFq+fGTMjU+dQIrRc1Z0q4Nx+WAnAO\ngh0AOI9G16bP2DZ97h1+YuHqJ/5a9vCrO/it6YOLti4ApQQfxQIAAEiCYAcAACAJgh0AAIAk\nCHYAAACSINgBAABIgmAHAAAgCYIdAACAJAh2AAAAkiDYAQAASIJgBwAAIAmCHQAAgCQIdgAA\nAJIg2AEAAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABIgmAHAAAgCYIdAACAJAh2AAAAkiDY\nAQAASIJgBwAAIAmCHQAAgCQIdgAAAJIg2AEAAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABI\ngmAHAAAgCYIdAACAJAh2AAAAkiDYAQAASIJgBwAAIAmCHQAAgCQIdgAAAJIg2AEAAEiCYAcA\nACAJgh0AAIAkCHYAAACScFO7ABfy8/NzcIYcp9QBV3L8KKOYcPxQWq1Wp1QCACWXzMEuNTXV\nwRk8nVIHXMnxo4xiwimH0tfX1/FJAKDkkjnYZWdnOzgDwa74c/woo5jgUAKA47jGDgAAQBIE\nOwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJEOwAAAAkQbADAACQBMEOAABAEgQ7AAAA\nSRDsAAAAJEGwAwAAkATBDgAAQBIEOwAAAEkQ7AAAACRBsAMAAJAEwQ4AAEASBDsAAABJEOwA\nAAAkQbADAACQBMEOAABAEgQ7AAAASRDsAAAAJOGmdgEAgHxpNBq1S0BR46DLzdXHl2AHAMVX\nQECA45NkOT4FipBTDjqKLcePr8ViKWArwQ4Aiq+kpCTHJzE6PgWKkFMOOootx4+voij+/v75\nbSXYAUDxVfCf5pASB11urj6+3DwBAAAgCYIdAACAJAh2AAAAkiDYAQAASIJgBwAAIAmCHQAA\ngCQIdgAAAJIg2AEAAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABIgmAHAAAgCYIdAACAJAh2\nAAAAkiDYAQAASIJgBwAAIAmCHQAAgCQIdgAAAJIg2AEAAEiCYAcAACAJgh0AAIAkCHYAAACS\nINgBAABIgmAHAAAgCYIdAACAJAh2AAAAkiDYAQAASIJgBwAAIAmCHQAAgCQIdgAAAJIg2AEA\nAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABIgmAHAAAgCYIdAACAJAh2AAAAkiDYAQAASIJg\nBwAAIAmCHQAAgCQIdgAAAJIg2AEAAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABIgmAHAAAg\nCYIdAACAJAh2AAAAkiDYAQAASIJgBwAAIAmCHQAAgCQIdgAAAJIg2AEAAEiCYAcAACAJgh0A\nAIAkCHYAAACSINgBAABIgmAHAAAgCYIdAACAJAh2AAAAkiDYAQAASIJgBwAAIAmCHQAAgCTc\n1C7gQVl3xy7cEn/ozxRd7XqP9B3er4axxP0IACRmT4+ijwFwlRJ2xu5c3IQ5a//7WOcBk0f1\n9j77zfjRi61qlwQAuezpUfQxAK5TooKdYp699kRI92kvtX68bpMnRr43LO3KjtWX0tQuCwCE\nEPb1KPoYAFcqScEu61b8hUxLmzaVbasephbh3u4Hd19VtyoAsLGnR9HHALhUSbqww5x2VAhR\nx6jPHQkzum0/ekv0vLN69uzZhIQE27JWqw0NDS3yGlHU9Hp94TuhJJDgUBbao+zZhz4GCX4X\nUABXH9+SFOysWWlCiAC3u2cZA/W6nNTM3NVly5Zt377dtuzn57dz504H3zHLwdfD9Xx9fdUu\nAc7h+KG0WCxOqeQfK7RH2bOP0/uYoJWVNLQ1ubm615WkYKd1NwghknKs3jqdbSQh26Izubvu\nHT1mzHXd5ChiylPN1S4BkrOnRxV9HxO0MqnR2XCPkhTs9F71hYg/lZET7HGnIZ7OyPFtYcrd\nYfz48VFRUbZlRVFyP86AEEKr1fr5+Qkhbt++nZ2drXY5cIjBYDAajVarNSkpSe1aipeAgAAV\n373QHmXPPvQxO5lMJp1Ol5GRkZ6ernYtcLIyZcro9fqsrKzU1FS1aymmCuh1JSnYeZpaVXJf\ntGPP9dYdgoUQ2WlHDqSYO7eukLuDwWAwGAy2ZavVmpiYqE6hxZKiKLkLucso6TiUxUqhPcqe\nfehjdsrb09StBC7C/63+mZJ0V6zQuL/+Yu0zy6fsOnjqyrljSyfNMlZ8pneQt9plAYAQoqAe\ndW7DqmUrthS8DwA4TlPC4rBi2bnig7U7DyRkakIathw8ZkBNr/ufdOQv3XtotVp/f38hxK1b\nt/gotqQzGo22j2L5j/wegYGBKleQT4/6z5CeHyQGxcXOKGCfv+MQF8BkMrm5uWVkZKSl8RRA\n2fj6+ur1+szMTD6KzU8Bva6kBTu70RDvQbCTCcEuP+oHO6fiEBeAYCcxgl2hCuh1JeqjWAAA\nAOSPYAcAACAJgh0AAIAkCHYAAACSINgBAABIgmAHAAAgCYIdAACAJAh2AAAAkiDYAQAASIJg\nBwAAIAmCHQAAgCQIdgAAAJIg2AEAAEiCYAcAACAJgh0AAIAkCHYAAACSINgBAABIgmAHAAAg\nCYIdAACAJAh2AAAAkiDYAQAASIJgBwAAIAmCHQAAgCQIdgAik04TAAANSklEQVQAAJIg2AEA\nAEiCYAcAACAJgh0AAIAk3NQuAEXEbDbv3btXCBEcHGwwGNQuBw65dOnSjRs39Hp99erV1a4F\nUMfPP/+clZXl7+8fGBiodi1wsmPHjmVkZJhMpnLlyqldS8mjURRF7RpQFG7evNmuXTshxIIF\nCx599FG1y4FDPv30048++qhChQpbt25VuxZAHZGRkWfOnOndu/eIESPUrgVONnDgwEOHDnXs\n2HHChAlq11Ly8FEsAACAJAh2AAAAkiDYAQAASIJr7EoLs9kcHx8vhGjcuLG/v7/a5cAh58+f\nP3v2rKenZ4sWLdSuBVDHvn37UlNTq1atGhoaqnYtcLKDBw8mJSVVqlSpTp06atdS8hDsAAAA\nJMFHsQAAAJIg2AEAAEiCYAd79ej0wtzLqWpXgYJkJe+MiIi4nm1VuxCguKOhlUS0OHsQ7AAA\nACRBsAOKmNXi0A1LDr48X5asNJfMC6B0ocWpjO+KLXksmRdWzl+679jJm5n62k1aDRjep6qn\nTghhvnXy0wWf/ffo2dtma2Clmm27D3upeZAQ4vqhrxet2nryzysar4CwR9qOGdzFqNUIJTvi\nhS4vL13bNfDO98b26dyxyfxVIyp55zcPHNSnc8c2k4b9NHvR+VsW3/IhPV+fGHJx46zP/u9a\nhrZGo6cmjetfRqcRQig5iXGffBx/+NSlJHOlkAYd+wx8praf/S8XQiSf2jVvyboTF5K8KlRv\n99Lg7k/XLGDaHp1e6PHxp9eXzvnumGHlSr69B0WNhiYNWlwxwRm7kkbJmTcyaudF7z4jJ8e8\nPcT3/M63x35m2/JZ1NS9icEjJsbMnhH9QiPrqpljr5mtOenHh09bJJpETH7n/XGDOp39ZtXU\nrX8W/A73ncf1P1ipsHn6pnYjYhbNn9HcePWjN4dPj1dGTp31TlSPPw9snbn3mm2flW+N2nhM\n03nAmPdi3mpXW8x9c9D/XU63/+VCiJhp6+s9/2pMzPjn67rFfjh25cnkgqf9Yd5UY5NO78wc\nWrT/GAANTTa0uOKAM3YlTMrFZd9dzZm+ZlRdo5sQolrM7ehZ8Uk5ip+bplzbl4Y/0+FhX3ch\nRFCFrku+nHYuK8cn41CGVWn37FMP+XmImjWi3/K77OFT8Fvcd57y7u5F8NNJL6T/2+0eriyE\n6Dq41lfjDk5+q09VD52oVqlz4Mr447fEExUyE76I++3Wvz8fU89LL4QIqVXPsr9n7EfH/xXd\n1J6X296l1vDobk9UEELUrts4/UTP7fP+89I0awHT3io/ILJ1A5X+SVCq0dAkQ4srDgh2JUzC\n/hN673BbExRCePq3/fe/29qWIzq2/2X/3o0XLl27dvX8iR9tg4aAF54K3TX91f71moTXCQtr\n1OSxR6r6FfwW950HTmEKK2NbcPPSa/Vlq3robKtldFqhKEKI1IuHFEV5u3uXvK/yyrkkRFN7\nXm7ToXFA7vJT7Sp+sfo/qRcNBUxb8Zlgp/6UgL1oaJKhxRUHBLsSxpqtaLT3+VvTmn0zZsiw\n37zqtG3eqG7T2m0iWo4ZMU0IodGVGTNr+UsnDh755ddfj363ccXiep2mTOnT6O8zZCtKAfPA\nBe5zIYSbl7tG57V2zbK8gxqt3s6X39k/74Teeo1GV/C0Rh/6ANRBQ5MaLU4dXGNXwgQ0rWZO\n+elMpsW2mpX8XZ8+fQ6lZqde/PTgdfP8WRN7vRTx5ONNgv3uPJ8p+cTmJUvjgsMefr5r73FT\n3pszqNbRbctzZ0vNufM3UNatH1Ittj+n7j8PioaxfFthTd+eaPG8w+Pzf09e8N3VB5rkqyOJ\nucvxm/80Vm7llGkBp6OhlTa0uCJQumKsBMrUGPSI6YepE+aP6NPe3y1ly0efmD2bNfbWZ2SG\nKsoPm+J/ea5++cQLxzcsXSmEuHAluZ5vxpbNa1K9/J5tWlOTdmXrV5e8gjoKIYRG/5BRHz9/\n3ZOvPatP+XPdgoUajUYIofe5/zyP+pRT9ecuLdx9Hu7fKOCzcTGeA1+sXdn7yM6lW04kTB73\nYP/4B+ZMjMvu37Ci57Hv1q35Pb3//EfdfbwdnxZwOhpaaUOLKwIEuxJGo/WMmhezdP7KJe9P\numU11mz4r+lDegohDIGdp/S9vmTle9vSddVCG/Z4a4Hf7GGx44Y1WbNmyiu3l29b/uaaVC9T\nYM0GbaYP6WybasK0gTPnrX9z6CazVQlrPeiJ5OUFz6PiT12qdJg0J+vj+esXzUjK1gfVaDDm\nnfGNvO/7OcX9ad38pr7aYvma+Z/fNFesXrPf2/OfD/Z2fFrAFWhopRAtztU0iuKaRwGihFAU\nc3KK4lfGQ+1CAMBRNDSAYAcAACAJbp4AAACQBMEOAABAEgQ7AAAASRDsAAAAJEGwAwAAkATB\nDgAAQBIEO7jE7188o9FoIn6+8fdNu9pX1Wg0XyVlurQA27sUYGNChksLACAfOhuKP755AnKq\n+uKg1+sl2Zat2ddnf7jCWK7TkN4huTuEGkrpQ8kBlFx0NhSKYAc5hb769sy/lrPTDs/+cIV3\npVdmzuygZk0A4Bg6GwrFR7GQgTUn2eKyyRWL2cL3swAocnQ2/AMEO6jMmn1zwZuvNAip4KnX\nlwkIfqbbiH03716kkvpH/KjItlXKmjy8/GuHPz118VfWvzYteyjAL2ROVvKBl5+q4+3hn/rg\nLerEwuYajWbepdS85TzjZ/Cu+IoQwqjTNlv08/yRHQK9jHqde9ngur2jFtzMzn3/gmoDUMrR\n2aAaBXCB85ufFkI8f+T63zftbFdFCLEtMcO2Oqt1ZY1G93Tka9OmT399cGdvndar4gtmq6Io\nSuqlTSEGvd5Yre/Q12Mmj3upZQ0hRKPey2wvXFrLv0yVCd2q+rV+ecSc+R9lWfMtxpx6SAhR\nrtGWe8Yzk77RajR1R+zLHbl1froQosVHJxRFMWg1proVNRq3f3V9ZcL4MRFPVBFCVGgRlaMU\nXhsAKdHZUPwR7OASdra/7PRTWo2mSvu43K1732gWGBgYez1dUZQpdQP0xrC9NzNyt24a00gI\nEXM2WVGUpbX8NRpN23kHCy0mv/anKMqoIB+D/7O5qzu6hWi0Hj+lmBVFMWg1QogR60/c2WbN\nXjq4nhCi7+5LhdYGQEp0NhR/BDu4hJ3tLyfzgqdWU6Zazx8v3L5nt+y0YzqNpv7YA3kHs5K/\nF0LUf/2AYmt/Ws9rZkuhxRTQ/n79qLkQ4pMrqYqiWC2pYUZ9YIPZtk0GrcarfK//KSnjtFGn\nrfj4+kJrAyAlOhuKP66xg5p0HsE73uml/Lnmkaqm6g2a9Rw4ZnHsjsQcRQiRmfi1RVF+mfVI\n3kc0eZhaCiFu/XLL9nJ370bl9A79N1yje7RWo5n34UkhxM2fo06kZ//rg265W00P9ci7s5tn\nzef8PVP++M6e2gCUWnQ2qIjHncAltHqtEELJuc9lv1azVQjhrtHYVp+M+ux637c2b966O37P\nDzuXf75kzpjRj20+9t3jWnchRP2opTOfrnTPDB6+jWwLGq2Xg3V6+LYaFeS96NN3xTvrd43+\nws2jytwnKtzd/FeRufQaoVizhB21AZAPnQ0lgNqnDCGnxFODhBBNoo/8fdOYIB+tzutmtkVR\nFHPKyX379p3OyM7d+utX04QQYYP3Zmec1mk0YQN/yPva7PQTsbGxu6+kKYqytJa/p+kZe4op\n4AMLRVFOLG4hhFh58XRZva5axJe54watxqtCv7x75mT+7qPTlgtfUWhtAKREZ0PxR7CDS1jM\n1+p66fXGhzYcvpp3/D+LXxVCVH56sW016cxIIUT45LtXb6Rf/1oIEdorXlGU6LoBboaau/I0\nlBX9amk0mhXXnNn+spK/12k0lZ+rLYSYejopd9x2ifHrm0/n/kyrRjQSQnTd9kehtQGQEp0N\nxR/BDq5ycfs0k5tWo9GFt3lh4LAxo4cNeDo8SAjhXaX1T7ezbPtYc5JblzVotJ7te7029d2Z\nk98c2jDQoNMHrP4zRVGUlD/WVvFw0xurd31l5Ix3pvZqU0cIUb/vSttrndX+FEV5vUoZIYSn\n6em8lysbtBqvyk30OvfnXh48dcq4zk9VF0KUe2Sk7ekDBdcGQFZ0NhRzBDu40K1T/xfVr2Pd\nquUN7jpPL9/Q8CeHR398Oet/7vZKv/rD8G6tqwSWcdPqfAKCWnZ8ddPhm7lbk09tH9SxZQWT\nt7vRv3ajFpOXfJ3911OdnNj+Tn7cQgjR8K0f8w4atJrqHb89vWVGs7DKnm56/0oP9Rgz50qe\nW9UKqA2AxOhsKM40isJXiqC0++ntRo+8e3TTjfQXAjxzB406bYWIb85taqViYQDwj9HZSice\nd4LSzpp9c+j8Ez7Bo/P2PgAo0ehspRaPO0GpNmT42PTTGw+kmF/dOEbtWgDAOehspRnBDqXa\n92s/Pp/j22vi+k9aV75nU6cXXzQ9XFaVqgDAEXS20oxr7AAAACTBNXYAAACSINgBAABIgmAH\nAAAgCYIdAACAJAh2AAAAkiDYAQAASIJgBwAAIAmCHQAAgCQIdgAAAJL4fyH5jOM+Y47XAAAA\nAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# I will calculate the average distance, for both the casual and member type users:\n",
    "\n",
    "usertype_avg <- tripdata_clean %>% group_by(member_casual) %>% summarise(avg_time = mean(ride_length),\n",
    "                                                                           avg_distance = mean(ride_distance))\n",
    "\n",
    "membervstime <- ggplot(usertype_avg) + \n",
    "                geom_col(mapping=aes(x=member_casual,y=avg_time,fill=member_casual), show.legend = FALSE)+\n",
    "                labs(title = \"Average ride duration by User type\",x=\"User Type\",y=\"Average time in sec\")\n",
    "\n",
    "membervsdistance <- ggplot(usertype_avg) + \n",
    "                    geom_col(mapping=aes(x=member_casual,y=avg_distance,fill=member_casual), show.legend = FALSE)+\n",
    "                    labs(title = \"Average ride distance by User type\",x=\"User Type\",y=\"Average distance in Km\")\n",
    "\n",
    "grid.arrange(membervstime, membervsdistance, ncol = 2) "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "2a7dfef6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:19:10.316633Z",
     "iopub.status.busy": "2022-07-31T09:19:10.314697Z",
     "iopub.status.idle": "2022-07-31T09:19:26.697538Z",
     "shell.execute_reply": "2022-07-31T09:19:26.695657Z"
    },
    "papermill": {
     "duration": 16.39729,
     "end_time": "2022-07-31T09:19:26.700365",
     "exception": false,
     "start_time": "2022-07-31T09:19:10.303075",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nAwAAkMT/Aacr8/OR0xvpAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Now checking the number of rides diferences by weekday:\n",
    "tripdata_clean %>% \n",
    "  mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "  group_by(member_casual, weekday) %>% \n",
    "  summarise(number_of_rides = n()\n",
    "            ,average_duration = mean(ride_length),.groups = 'drop') %>% \n",
    "  arrange(member_casual, weekday)  %>% \n",
    "  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +\n",
    "  geom_col(position = \"dodge\") +\n",
    "  labs(title = \"Number of rides by User type during the week\",x=\"Days of the week\",y=\"Number of rides\",fill=\"User type\")+\n",
    "  theme(legend.position=\"top\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "68577b96",
   "metadata": {
    "papermill": {
     "duration": 0.010309,
     "end_time": "2022-07-31T09:19:26.721377",
     "exception": false,
     "start_time": "2022-07-31T09:19:26.711068",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Analysis:\n",
    "\n",
    "* It seems that the casual users travel the same average distance than the member users, but they have much longer rides, that would indicate a more leisure oriented usage vs a more \"public transport\" or pragmatic use of the bikes by the annual members.\n",
    "\n",
    "* This idea is reinforced by the fact that annual users have a very stable use of the service during the week, but the casual users are more of a weekend user. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "cc095d56",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:19:26.745884Z",
     "iopub.status.busy": "2022-07-31T09:19:26.744016Z",
     "iopub.status.idle": "2022-07-31T09:19:48.944623Z",
     "shell.execute_reply": "2022-07-31T09:19:48.942533Z"
    },
    "papermill": {
     "duration": 22.21559,
     "end_time": "2022-07-31T09:19:48.947191",
     "exception": false,
     "start_time": "2022-07-31T09:19:26.731601",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\ngft1zi8vee3272fVH3/70gcXmM0Kb87Ykc8u9MBrT/xHCGHrM/rXDS3Lbl/UCu6oJn/xNKQ1\nvKgAaFHpLsvmtYQzdt//+2+bts8JIWx+2Xu1I0v+HrtUKvXMcQNCCJ02GFl79mLyv0eHELIL\nN/jrv+Z9/KKmauY9p20dQujQd8QSZlV7cqVdj5MWGv/q4Z1DCFnts0III96dUv+uuu/vOObm\nF2tPudRUzrjjtG1CCNmFAydVzPvQZKOn9PFNm4cQivseXfdU0z56dEBBVqh3Iqq64qfOWclE\nInnuYx/UPXDKh0/0zctKJDJfnlGWSlX3ystMJBJ3fPjzSaC3HrpqnfysEEKPoc/UDX459uAQ\nQvE6h35cUjFv5IWrizKTIYTCbsfULdbozanbXcf/cVzt9lRXTrvtpCEhhLxVdp694PeGLGG3\nN9uOWtZNW94zdq3qRQVAy2sTYbfQ99j169evR8d577LquP6hdd/XtdSwqyr/flC77BDCoQ/N\n+76MR0fuUPs8a24waLtttujdOTeEkFM08OlJpamGVVf+LycjkUhk7bTvAUed8GLdeGXph7kZ\niRBCduFGC32v7LwPMB4xOISQXdTjF4PW75CTDCEkszpd9fqk+ks2bkrlJf9YMzczhJDbuf+v\n9h62zaD18jIS2YUbrF+QVf8K45sX7Fj75F36bLjt9tttukGfjEQihLD9mc/VLvDGeUNDCBnJ\ngiE77v7rvXbesO+qGcnCA0edGUJIZnc74nfH130Z262HbxBCyMhqt96grdbvtWoIYbeLbgkh\ntOt5xopvzgndCzNzVh/cJS+EkFPcY9NN1yvKToYQMnPX/PPHC39Udgm7vfl21DJu2rKHXSt8\nUQHQ8tpE2C0qmZ3frc/AI8+68ceKn3/WLTXsUqnUd0//LoSQVbDeZ3PmfUXZfx+/adgOg1bp\nUJiZlbtqrw0OOunijxr+sow6r146fI0uRRmZ2X2HPlh//NJ+HUMI6xz16kLL1/4Mfmd2xWu3\njdy8X8+C7Mz2nbtvN+zYZz5aOFMaPaXpHz9x5G6Du7Sfl7yFPbf860fT9+ucv9Bbx/5x/+V7\nbLnxKkUFyYzMdh27D97xgJse+2+9+6ufvG7U5gNWz8tOFnboMnjXQx57f2oqlbrx8KFFuZkF\nnXrOrPtG6JrKJ64fufMWGxbl5Pfou/m5d74xd9rTIYTi3teu+Oac0L0wp/0WlbO/uPLUwzZY\n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\nNLhuyaq5nz78+HtdN8xfllUOP2fDq3/7t/smfnHqG5NW2+XRTvW+EnnGhLEh7FR3s7r82yem\nlhVsMDS34+YruNLm1nmjG3Zf9aFdtz/mjj/8rnv21OuPO6WscN+dO+TULZDTadNUzUNXPjDu\nhG3WmvjR+EtPGx1C+PjLyUO7zLruqjHTirset+smiZIvb7xpQtE6p4UQchoYX/Y1LtYTh+1w\nWdk12/UpGH/vxWM+mHnth3sudrFfnvfszrd0H7bvbd8/f2Jux12v2aHHWUP2KLz+rM37dnjh\njtOv+8fEpx9acwX32Apa6qwaWqBz+wb3WzIRZn/92aRJa3ft2nmxK23j+xyWyhk7SLM3rzk+\nhLDucest9t5EYt7/pEf89ZE1cjOv2eOwaVU1mbl9xvTv+Pm9h780aU7dkn89fs8DDzzwu4b/\nn06lfv53r/0vTiYSZ/529ymV1UdetcBHN0on3XXG37+Yf6vmgZF7zaqu2fqioY1baUtKJAvH\nfvDyr3t8f9JBO2y992+/HXD0uP/cUH+Bdqud8ezlxz1+9v79Bgw+9coXjnv4o+Gb9rxgyHrf\ndDv7matOeO/OUVttuvFuB586ZaOjx407I4RQvPb5ix1f9jUuKpnd7bmrh/3tguFDtt7nzrfD\nFY98OGLdDg1sTtFdT5818cWTznp9UgjhxCffPnefjpcc9+tNt9ztnve63Tv+3zssrWZawFJn\ntdgFlrDftjplzzmvDV9ns1MbWqN9DkuWSNU/2APN5u2zNvrFpe9tddypg9vXfXhi7pfvv/K3\n597PW2WbCd+/0DMnGUK4ZK3iP5QNm/Xj7SGEAQXZ0zf4+w9v7lK7/Kd/3GPd3z6x6ejX3rpo\nyOzvHhzQ9+Afkz33PmCPTdbu+OHLY+994eP1j7j3/bsOWXTVE1/eebXtntvxvOsPX3fQQQds\nVjt4xhpFV343M7d429LpL9WFWX4yI6PbxhWTPtjxwN8M6lP03rgHHxn3dZdBJ33/z2uzE2G5\nVlo+qunfjZRz2fVN/pwxSYz7R5M/Z2rrLZr8OYHm41IstKjxN189fv6/E4mMgqKu2+1/yiU3\nXVJbdUvWb/jDR1++yp2X7fr4iEl7rP7r998vGjXqD39/5I7HKrJ79e1//u3PnHPUzot9YJfN\nLttt4wkvXnzqBwPOrQu7o8/Z4MpjXl/nd5ctdLqty6ZXPH/Uvw8fef0fHpic36XXQadec9Wl\n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\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiERmuifQjMrLy6uqqtI9i8WLeb/Dyq+0tLQF1uI4AK1cyxwKlldG\nRkZeXl5D98Z8YEmlUqlUKt2zAFY+Dh1AaK2HgiXPKuawy83NTfcUGlSe7gkAS1BYWNgCa3Ec\ngFauZQ4FTct77AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewA\nACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIpHZuIf99Obo4X/4oP7Ib+56cK9O\nuSHUjHvg5ifGv/P9rGS/9QYdceKRvfJrV9Hc4wAAbV0jq2jGuzPyOu1+0vABdSNrtMsKIXz1\n8DnXjP32kONP+E2Hqqduu2n0KRX333Z8RvOPAwDQyLCb/PHM4v6DBw8esMBoquLqsZ/0PvDK\nYdv3DiH0uTwx7LDL7594xKHds5p3vEfBiu0EAIAYNPJs17szyzsMLK6eO3PS5Bmp+YPlJeO/\nK6veYYcetTdziocMLMx+e9yk5h5v3CYAAESmkWfs/ju7MvX69b++4dPKVCqzYJWdDjrpt7tv\nUFH6fgihf35W3WLr5mc++35JxdbNOx4OXvwkq6urU6nU4u8DaFhVVVW6pwCkX+s8FCQSiWQy\n2dC9jQm76oqJs5NZa3YefNn9FxanZv3r6TuvuP2cnLXv2Tu7NITQKfPns4Cds5JVs8tqypt3\nvKF5zpkzp7y8vBEb2ALapXsCwBLMmDGjBdbiOACtXMscCpZXMpns0KFDQ/c2JuyS2T0efPDB\n+bdyttx/5GfPvv3ynz7c9+S8EML0qprC+SE5tbI6WZydkd28443YBACA+DTNd4UMXDXvxWlT\nsgrWD2H8hLlVPXPmhdfnc6uKhhQ393hDsyooKMjPz2+SDWxyrfHcLjDfEn4bbkKOA9DKtcyh\nYHklEokl3NuYD0/M+Oymo44+flJFzfyBmld/mFPcv29u8Tbds5PPvT65drSy9N23ZlVsvH3X\n5h5vcNsyMpKtVSN2O9BiHAeA0FKHguWVkbGkeGtM2LXvtX+nOT+NGnPbvz+c8PlH7z5w7cjx\npe2OObpvSGSfvl+/L+4e8+LbE3786sM7z7sqv9t2h61W2OzjAACEkGjc50bLp3901633/+O9\nz8uS7Xqtvd5evzlm89ULQwghVf3CPdeOfeGtqWWJ3hsOPfbU4X0KMltifGVTPmpEuqdAk8nd\nZf90T4Emltp6ixZYi+NAZBwK4tMyh4Km1ciwYwU5oMfE0Tw+wo5GcCiIz8oYdv4cFwBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkMtM9gWY0d+7cqqqqdM9i8bLTPQFgCWbNmtUCa3Ec\ngFauZQ4FyyuRSBQWFjZ0b8xhl5GRkZHhlCSw3Bw6gNBaDwVLnlXMYZeTk5OTk5PuWSxeebon\nACxBQUFBC6zFcQBauZY5FDSt1piiAAA0grADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIRGa6J7C8asY9\ncPMT49/5flay33qDjjjxyF75K90mAAA0i5XsjN1XD59zzdg3f7nP8PNPPqzwy5dGn3JbTbqn\nBADQSqxUYZequHrsJ70PvHDY9psP2GTLky4/ofTH5+6fWJruaQEAtAorU9iVl4z/rqx6hx16\n1N7MKR4ysDD77XGT0jsrAIBWYmV6g1pF6fshhP75WXUj6+ZnPvt+STh48ctXVVVVV1e3zNyA\nmJSXl6d7CkD6tc5DQSKRyM7ObujelSnsaspLQwidMn8+y9g5K1k1u6yh5efOnds6/5OEENql\newLAEsyaNasF1uI4AK1cyxwKllcymYwk7DKy80II06tqCpPJ2pGpldXJ4ga3rTWbdcZ56Z4C\nTWZKuifASspxIDIOBbQGK1PYZRWsH8L4CXOreubMC7vP51YVDSluaPnCwsLCwsKWmh1tVGVl\n5cyZM0MIxcXFyfm/cgBtzfTp02tqavLz8/Py8tI9F9q0lSnscou36Z5963OvT95+t54hhMrS\nd9+aVbHP9l0bWj6RSLTg7Gij6l5miUTCSw7aOMcB0m5l+lRsSGSfvl+/L+4e8+LbE3786sM7\n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\nQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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\nmnqbU7/oj+Pqz/4wryETQmirH4CO67/qPtnGBbd80lC6SMklB37vhLvf7VQnN//146bf77v+\njf6j98hLtywPBDuWGYMmnLP9kMz+k3/86NMv/Oe5x07a+4ya0h22HlBYOHC9bKb+uvue+d9H\n7/3jid8evte5IYQ33v0sPaTyF9ef/8Of3vX8i6/+85mHrr75v/1X3yWEEBKF6/cr/P2Pr/z3\nf//36ozHjp08LZlIhBDa6se3J4COK6rY9owtVrxotym3TH/slRefv/6Ub//yuY/33GVkpzp5\n5OjvXnP3I/96/m83nLzXpa8uOOqKHfPSLcsDp2JZZiRSZdc99tuzfnz+aUd8d1Zjv3U2/97d\nF/w4hFC+0uG3nvr+Ty447KbK9Pj1Njvu508MO3qby761zdYvv3zL6bPPvencb186t/+Q4etu\n9r3fnf+DXFc3337O4cdf9e2tr6tpzGw4+dxvfnbO0vvpzdUGljUH/fqh6lNPuPKkw2bWFa6x\n9qQr77lxiwGdOFWaKhh22xm7nnvZjy/5sGa1Cev+5BePf3/MgO53y3Iikc1m258KYpTN1Hw6\nNztsUElvFwIA+SHYAQBEwjV2AACREOwAACIh2AEAREKwAwCIhGAHABAJwQ4AIBJuUPyFbDab\nyWRCCKlUqrdracUyUV4ikUgm++JfC8rrjj5eXiaTyWazfba87sitWjKZTCQS7U/9pWtsbAwh\nKK9rlNcdylsKwe4LtbW1lZWVIYQhQ4b0di2tyJWXSCQGDx7c27W0oqamZuHChclkctCgQb1d\nSyuqq6urqqr6eHmpVGrgwIG9XUsrqqqqqqur0+l0RUVFb9fSiqqqqpqamj5bXnfMnTs3k8mU\nlZWVlPTF22jPnTs3m8328fLKy8uLi4t7u5ZWzJkzJ4TQr1+/oqKi3q6lpWw2u0yU179//8LC\nPve/NzKZTK68AQMGFBQUfPkFxPYHLgDAckuwAwCIhGAHABAJwQ4AIBKCHQBAJAQ7AIBICHYA\nAJEQ7AAAIiHYAQBEQrADAIiEYAcAEAnBDgAgEoIdAEAkBDsAgEgIdgAAkRDsAAAiIdgBAERC\nsAMAiIRgBwAQCcEOACASgh0AQCQEOwCASAh2AACREOwAACIh2AEAREKwAwCIhGAHABAJwQ4A\nIBKCHQBAJAQ7AIBICHYAAJFI93YBALCY2mlHd7+T8hBCCNkzL+p+V7AMccQOACASgh0AQCQE\nOwCASAh2AACREOwAACIh2AEAREKwAwCIhGAHABAJwQ4AIBL+8wQAdEJe/jFGv9yPsy7uflfQ\nnCN2AACREOwAACIh2AEAREKwAwCIhGAHABAJwQ4AIBKCHQBAJAQ7AIBICHYAAJFo/z9P1M1/\n/RdX/vLp//y3JlW2ymrjdz/kiE1XLe/q4jJP3HHt/U8+//6C1Li1N5py1IGjS9MhhE+eOeXg\n8//TfLqDbrprt8HFXV0KAMDyqN1gl7322NP+Uf61I049aEhy4eN3XnXJ8dPWvO2qIQVdOdT3\n1t2nXn7nu/seceRBAxseuP6aU35Ud+v1RyRDmPvC3JLBu/7w4AlNU67ar6AL/QMALM/aCXa1\n8x5/bGbVjy79wSYDikIIq5344z9898Q7P606YnjnD9pl6y6785XV975kz+1WDyGscVFiz/0v\nuvWDKfuNKJv58vyK8ZMmTZrQbh8AALSlnQNvyfSQgw466Gv9Chc9TqRDCKWpZAgh2zD7d9dd\ncPShB+6+1z5HnXThn1+d03zGbLb2nXfeb95SO+/J92oat99+RO5hUcVmE8sLZzzxcQjhhfm1\nAydWNFbP/3jm3Gx+1gsAYLnTzhG7grJ1d9tt3RDCnBeeff6jj57/891DJ+y637DSEMJvTjrm\noeoJhxx87Mj+iVefeeDKEw9tvPbmHYaX5mZsrHn7mGPPv++eXzV1Vbfw3yGE8aVfnGNdqzT9\n0L/nhX3CPyvrs09duddVr9Zns+myoTt+74eH7rpuWyVVVlZ2Y32XprGxsacX0R258rLZbN8s\nr6GhISivq3LlZTIZ5XVBfX19CKGxsbHnyisuLk6nW99b1tXV1dXV9dBys9lsbhFNe6c+JVde\nbW1t3svL47U4tbW1uQ04j/JYXk1NTW4D7lNyr2zoq+U1qamp6bl3X5c1jV51dXVtbW1PLCKZ\nTJaWlrb1bPtfnsj55KnHHnrzg3ffrd7kO6NCCDWzfn/36/POve3YtcsKQgirj1278dl97vjZ\nSzucvWFbPWRqF4YQBqe/OEY4pCDVUFnTWPdBZapg1JBJF956VkV2wbMP3njxz08tGvPrKeMq\nWu2npqamgzV32ZewiO7oy+Vls1nldVkfLy+TyfTl8np09NLpdFvBrqGhoaeHpb6+vi9/uDY0\nNPTl5NQTo9fHy8ujPl5eH0x1zfVcealUKg/BbtyRJ10cQtWHfz/0yPPOXGEVybkAACAASURB\n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\nG6+9eYfhpbkpG2vePubY8++751dN89Yt/HcIYXzpF+dY1ypNP/TveWGf8M/K+uxTV+511av1\n2Wy6bOiO3/vhobuu21ZJlZWVSzbm98Rtq4vodY2NjSGEbDbbN8traGgIyuuqXHmZTGZ5Ky+P\n79zGxsaeG73i4uJ0uvW9ZV1dXV1d3ZLteVy1urq63Ns/j/JYXm1tbV8uL1+ab13K65QWb8w8\nlldTU9Pqu6878lhedXV1bW1t/vr7QjKZLC0tbevZTtzH7t1/PHjlT2+sH73TKV9fuWbW7+9+\nfd65tx27dllBCGH1sWs3PrvPHT97aYezN2xr9kztwhDC4PQXxwiHFKQaKmsa6z6oTBWMGjLp\nwlvPqsguePbBGy/++alFY349ZVxFq/3U1NQs2Zjf7bjVRfQdfbm8bDarvC7r4+VlMpm8l5fH\nd26Pjl46nW4r2DU0NPT0Tqm+vr6+vj5//YWQ1/IaGhpy0T+P+lo0CYvveJXXKS3eIPn9myd/\nnS3Sx8vLSaVS3Q12dXNeu/GqK//4z9lb7nH4ud/bpjiR+Ox/z2ez2ZP33r35ZGUNH4Ts+jW1\n9SGEhpra0OzlLCouThaWhBDmNGTKU6lc46z6xlRFYapwxF133fV5H0WbTz7h9YdmPPaLF6dc\nslnrFbexe82jL2ERXZDNZnN/FvfN8jKZTCaTSSQSqc9f3z4lV14wel3Sx8tr0nMvbjLZ5lUr\nyWSypzeqVCqVSCR6dBHdkUwmlzI+0eibu44mfbm8nqutj781eq68pb/j2h/uBe/++bjjr06t\ns9NFP99/zSGLbkGSLitMpMruvP2m5lMmkgVVn97+3alNKS3stddeuV+uuOve4WXrhPDka9UN\nI4sWfTa8Ud0wYLNWDstNXKHk0dmftlVPRUUrs+T3WGeri+h1NTU1lZWViUSib5ZXXV29cOHC\nPlteVVVVVVVVMplUXhcsXLiwuro6lUrlvbw8vnPT6XSvjF5xcXFxcSv3ZsrjqhUXF5eUlOSv\nvxDyWl5JSUlfLi9fmm9dyuuUFm/MPJZXVlZWWFiYv/5CyGt55eXlBQW9cPy0nT+zspmqc6dd\nW7Tt0deedkhTqgshlK6wY8hUPTS7sXiRotvOPf2axz8uHbbv9OnTp0+ffs+dFyXTA6d/bnRx\nqrhi6+GFqT89NTPXQ/3CF/6+oG797Vac+/o13596xMd1mc/7zvzlw6qK8WN7ZHUBAOLVzhG7\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Create a new data frame with only the rows with info in the \"bike type\" column:\n",
    "\n",
    "with_bike_type <- tripdata_clean %>% filter(rideable_type==\"classic_bike\" | rideable_type==\"electric_bike\")\n",
    "\n",
    "#Then lets check the bike type usage by user type:\n",
    "\n",
    "with_bike_type %>%\n",
    "    group_by(member_casual,rideable_type) %>%\n",
    "    summarise(totals=n(), .groups=\"drop\")  %>%\n",
    "\n",
    "ggplot()+\n",
    "    geom_col(aes(x=member_casual,y=totals,fill=rideable_type), position = \"dodge\") + \n",
    "    labs(title = \"Bike type usage by user type\",x=\"User type\",y=NULL, fill=\"Bike type\") +\n",
    "    theme_minimal() +\n",
    "    theme(legend.position=\"top\")\n",
    "\n",
    "#And their usage by both user types during a week:\n",
    "\n",
    "with_bike_type %>%\n",
    "    mutate(weekday = wday(started_at, label = TRUE)) %>% \n",
    "    group_by(member_casual,rideable_type,weekday) %>%\n",
    "    summarise(totals=n(), .groups=\"drop\") %>%\n",
    "\n",
    "ggplot(aes(x=weekday,y=totals, fill=rideable_type)) +\n",
    "  geom_col(, position = \"dodge\") + \n",
    "  facet_wrap(~member_casual) +\n",
    "  labs(title = \"Bike type usage by user type during a week\",x=\"User type\",y=NULL) +\n",
    "  theme_minimal() +\n",
    "  theme(legend.position=\"none\")\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "84620506",
   "metadata": {
    "papermill": {
     "duration": 0.012175,
     "end_time": "2022-07-31T09:19:48.971512",
     "exception": false,
     "start_time": "2022-07-31T09:19:48.959337",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Analysis:\n",
    "\n",
    "* Here we can see that the annual members use both types of bikes for their rides, but the casual users show a clear preference for the electric bikes, which makes sense given the long duration of their rides.\n",
    "​\n",
    "* On a weekly basis we can see that for the annual members there is a small difference of usage between the start of the week, where they prefer the classic bike and the end of the week, where they use more electric bikes.\n",
    "​\n",
    "* For the casual users we see in general the same pattern of usage from the previous weekly charts, preferring the electric vs the classic bikes and having a weekend usage of the service."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "e76314a8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2022-07-31T09:19:48.999866Z",
     "iopub.status.busy": "2022-07-31T09:19:48.998098Z",
     "iopub.status.idle": "2022-07-31T09:20:12.566958Z",
     "shell.execute_reply": "2022-07-31T09:20:12.563978Z"
    },
    "papermill": {
     "duration": 23.586728,
     "end_time": "2022-07-31T09:20:12.570686",
     "exception": false,
     "start_time": "2022-07-31T09:19:48.983958",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'month'. You can override using the\n",
      "`.groups` argument.\n",
      "Don't know how to automatically pick scale for object of type difftime. Defaulting to continuous.\n",
      "\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nljuRuX/YMfTSyok7j5y/feXUivEzNYGv9gz2cveu16d20TWjpmzff+TalfM/Lhm97WzsK42K\n56Irq+0AnsBgAQDpctJy8xW7TBmUNidq9vhYnaxCrSZTJvW1VJStxs9OWzp/4+Jp8XplcPma\nIz6PrO2lzF1X1toBPIHBAgBS5az7CMkUzXqNbNYra7NPx4GRHQdmv5GbR+hj38Pa7MpqO4An\nMFgAQKL4Qx0AAEAiKOwAAAAkgsIOAABAIijsAAAAJILCDgAAQCIo7AAAACSCwg4AAEAiKOwA\nAAAkgsIOAABAIijsAAAAJILCDgAAQCIo7AAAACSCwg4AAEAiKOwAAAAkgsIOAABAIijsAAAA\nJILCDgAAQCIo7AAAACSCwg4AAEAiKOwAAAAkgsIOAABAIijsAAAAJILCDgAAQCIo7AAAACRC\nZjabXZ2Ds5lMpri4uGyfunjxotlsLlGihI+PT479xMfHx8TEKJXKcuXK2bPfCxcuCCFKlixZ\npEiRHIPj4uLu37+vUqnKlCmTY7DJZLp06ZIQIigoyMvLK8f42NjY2NhYd3f3smXL5hhsNpsv\nXrxof+f379+Pi4tTq9WlS5fOMdhoNF6+fFkIUapUKU9PzxzjY2Ji4uPjPTw8QkJCcgw2GAxX\nrlwRQoSEhHh4eOQYf+/evYSEBBudBwQE5NiJxNgYLA79KxJCJCcnR0dHCyEqVqwol+f8J6Wj\n/zaEEP/++29aWlpAQIC/v7898Xfv3k1MTPT09CxVqpQ98YmJiXfv3pXJZJUqVbInPj09/dq1\na0KIsmXLuru727PJpUuXTCaTnb8lhBDR0dHJyclFihQpWbKkPfGWXyz2v2tarfbmzZtCiPLl\ny7u5ueUYb8+vi2dwHAFOZUYmDRs2DA8P//777+0JXrZsWXh4eMuWLe3svF69euHh4du2bbMn\neNGiReHh4e3atbMnOD09PTw8PDw8/Ndff7Unfu7cueHh4Z06dbInOCUlxdL5rl277ImfOXNm\neHh49+7d7QlOTEy0dL5v3z574r/44ovw8PDevXvbExwTE2Pp/I8//rAnfvLkyeHh4X379rUn\nGPPmzbP/X5HZbN67d6/l7Xjw4IE98fHx8Zb4AwcO2LmLdu3ahYeHL1q0yM74CRMmhIeHDxw4\n0M74zZs3h4eHv/DCC3bGX7hwwXII58+ft3OTF198MTw8fMOGDXbGDx48ODw8fNy4cXbGL1my\n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\nAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Exploring effects of seasonality\n",
    "\n",
    "month_analysis  <-  tripdata_clean%>%\n",
    "                    mutate(month = month(started_at, label = TRUE)) %>%\n",
    "                    group_by(month, member_casual) %>%\n",
    "                    summarise (no_of_rides = n(),avg_ride_length = mean(ride_length))\n",
    "\n",
    "Avg_ride_lengthvsmonth <- ggplot(month_analysis) +\n",
    "                          geom_col(mapping = aes(x=month,y=avg_ride_length, fill=member_casual),position = \"dodge\") + \n",
    "                          labs(title = \"Average ride duration by months\",x=\"Months\",y=\"Average ride duration\") +\n",
    "                          theme(legend.position=\"top\")\n",
    "\n",
    "No_of_ridesvsmonth <- ggplot(month_analysis) +\n",
    "                      geom_col(mapping = aes(x=month,y=no_of_rides, fill=member_casual),position = \"dodge\") + \n",
    "                      labs(title = \"No. of rides by months\",x=\"Months\",y=\"No. of rides\") +\n",
    "                      theme(legend.position=\"top\")\n",
    "\n",
    "grid.arrange( No_of_ridesvsmonth,Avg_ride_lengthvsmonth , ncol = 3)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9a9f4e9b",
   "metadata": {
    "papermill": {
     "duration": 0.013138,
     "end_time": "2022-07-31T09:20:12.598042",
     "exception": false,
     "start_time": "2022-07-31T09:20:12.584904",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### Analysis:\n",
    "* For both the casual riders and annual members, No. of rides are maximun in the months of June and July (summer being the turning point) and the numbers drop to minimum in the months of January and February (chilled winter winds may be the reason).\n",
    "* Average ride duration for annual members remain constant throughout the year but for casual riders, the distance increases in the month of June and July indication of people going to distant places for enjoying their summer vacations.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "02b27686",
   "metadata": {
    "papermill": {
     "duration": 0.013703,
     "end_time": "2022-07-31T09:20:12.624626",
     "exception": false,
     "start_time": "2022-07-31T09:20:12.610923",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Phase 5 : Share - \n",
    "\n",
    "\n",
    "Taking in consideration of the business task: **What could motivate the “casual” users to change to an annual subscription based on their behavior?** and the insights we've learned from the available data we can make some conclusions.\n",
    "    \n",
    "1. **The Casual users** rides are more **leisure** based, and their **tourism** rides mostly occur on **weekends** and they prefer **electric bikes**.\n",
    "    \n",
    "2. **The Annual users** have **commute** or **pragmatic** rides, during **all week** using both **electric & classic bikes**.\n",
    "    \n",
    "#### Recommendations - \n",
    "\n",
    "1. The marketing campaign should be launched between June - July (Summers), as the number of trips made by casual riders and average ride duration peaks at this period of the year.\n",
    "2. As casual rider usage reach its highest point on the weekend, the marketing campaign can include weekend-only membership at a sensible price. This could attract casual riders to convert to members.\n",
    "3. Identify the casual riders who book rides consistantly over the whole week and offer them discount vouchers for annual subscription and showing them the benefits of annual subscription through social media.\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6f36fe7d",
   "metadata": {
    "papermill": {
     "duration": 0.012854,
     "end_time": "2022-07-31T09:20:12.650365",
     "exception": false,
     "start_time": "2022-07-31T09:20:12.637511",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## Phase 6 : Act -\n",
    "\n",
    "Now It's time to share this analysis using a comprehensive summary based presentation which you can find here."
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 299.713253,
   "end_time": "2022-07-31T09:20:13.085866",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2022-07-31T09:15:13.372613",
   "version": "2.3.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
