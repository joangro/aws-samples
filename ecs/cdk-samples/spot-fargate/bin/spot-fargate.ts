#!/usr/bin/env node
import 'source-map-support/register';
import * as cdk from '@aws-cdk/core';
import { SpotFargateStack } from '../lib/spot-fargate-stack';

const app = new cdk.App();
new SpotFargateStack(app, 'SpotFargateStack');
